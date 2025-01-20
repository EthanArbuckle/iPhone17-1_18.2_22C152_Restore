@interface _HAPAccessoryServerBTLE200
+ (BOOL)isHAPDescriptor:(id)a3;
+ (BOOL)isHAPService:(id)a3;
+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4;
+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6;
+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6;
+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5;
+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6;
+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5;
+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5;
+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4;
+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4;
+ (id)logCategory;
+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6;
+ (id)parseSignatureResponse:(id)a3 error:(id *)a4;
+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5;
+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5;
+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6;
+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
- (BOOL)_cancelDiscoveryWithError:(id)a3;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3;
- (BOOL)_shouldResumeConnectionIdletimer;
- (BOOL)_validateGeneratedBroadcastKey:(id)a3;
- (BOOL)_validateProtocolInfo:(id)a3;
- (BOOL)authenticated;
- (BOOL)enhancedEncryption;
- (BOOL)hasBeenDiscovered;
- (BOOL)hasValidCache;
- (BOOL)isBLELinkConnected;
- (BOOL)isBadSetupCode;
- (BOOL)isHAPCharacteristic:(id)a3;
- (BOOL)isPairing;
- (BOOL)isSecuritySessionOpen;
- (BOOL)isVerified;
- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5;
- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5;
- (BOOL)shouldVerifyHAPCharacteristic:(id)a3;
- (BOOL)shouldVerifyHAPService:(id)a3;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4;
- (BOOL)waitingForAuth;
- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo;
- (HAPAuthSession)authSession;
- (HAPBLEAccessoryCache)accessoryCache;
- (HAPCharacteristic)identifyCharacteristic;
- (HAPCharacteristic)pairSetupCharacteristic;
- (HAPCharacteristic)pairVerifyCharacteristic;
- (HAPCharacteristic)pairingFeaturesCharacteristic;
- (HAPCharacteristic)pairingsCharacteristic;
- (HAPPairSetupSession)pairSetupSession;
- (HAPSecuritySession)securitySession;
- (HMFTimer)connectionIdleTimer;
- (NSError)pairingDisconnectionError;
- (NSMapTable)characteristicEnableEventCompletionHandlers;
- (NSMapTable)characteristicWriteCompletionHandlers;
- (NSMutableArray)pendingRequests;
- (NSMutableArray)pendingResponses;
- (NSMutableSet)discoveredAccessoryCharacteriticsPendingRead;
- (NSOperationQueue)pairVerifyOperationQueue;
- (NSOperationQueue)requestOperationQueue;
- (NSString)debugDescription;
- (NSString)description;
- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16;
- (_HAPBTLEDiscoveryContext)discoveryContext;
- (double)pairSetupBackoffTimeInterval;
- (id)_characteristicForCBCharacteristic:(id)a3;
- (id)_decryptData:(id)a3 error:(id *)a4;
- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4;
- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5;
- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4;
- (id)_getCachedService:(id)a3;
- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4;
- (id)_getProtocolInfoService;
- (id)_getServiceInstanceID:(id)a3;
- (id)_hapServicesFromCache;
- (id)_parseCharacteristic:(id)a3 error:(id *)a4;
- (id)_parseService:(id)a3 error:(id *)a4;
- (id)_pendingRequestForCharacteristic:(id)a3;
- (id)_pendingResponseForRequest:(id)a3;
- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4;
- (id)_serviceForCBService:(id)a3;
- (id)connectionCompletionHandler;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)getLocalPairingIdentityWithError:(id *)a3;
- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)protocolInfoServiceSignatureCharacteristics;
- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5;
- (id)setupCodeCompletionHandler;
- (int64_t)connectionState;
- (int64_t)discoveryRetries;
- (unint64_t)_getPairSetupType;
- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3;
- (unint64_t)_outstandingRequests;
- (unint64_t)hapBLEProtocolVersion;
- (unsigned)featureFlags;
- (void)_cacheServices:(id)a3;
- (void)_cancelAllQueuedOperationsWithError:(id)a3;
- (void)_cancelConnectionWithError:(id)a3;
- (void)_checkForAuthPrompt:(BOOL)a3;
- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5;
- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)_continuePairingAfterMFiCertValidation;
- (void)_createPrimaryAccessoryFromAdvertisementData;
- (void)_discoverCharacteristic:(id)a3;
- (void)_discoverCharacteristicsForService:(id)a3;
- (void)_discoverServices;
- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6;
- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4;
- (void)_establishSecureSession;
- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)_getPairingFeaturesWithCompletionHandler:(id)a3;
- (void)_handleCompletedDiscovery;
- (void)_handleConnectionIdleTimeout;
- (void)_handleConnectionWithError:(id)a3;
- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4;
- (void)_handleDiscoveredCharactersitic:(id)a3 error:(id)a4;
- (void)_handleDiscoveredDescriptors:(id)a3;
- (void)_handleDiscoveredServices:(id)a3 error:(id)a4;
- (void)_handleEventIndicationForCharacteristic:(id)a3;
- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4;
- (void)_handlePairSetupSessionExchangeData:(id)a3;
- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3;
- (void)_handleRawResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5;
- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4;
- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4;
- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4;
- (void)_handleReadServiceInstanceId:(id)a3;
- (void)_handleReadServiceSignature:(id)a3 error:(id)a4;
- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5;
- (void)_handleSecuritySessionSetupExchangeData:(id)a3;
- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4;
- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4;
- (void)_kickConnectionIdleTimer;
- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegatesPairingStopped:(id)a3;
- (void)_pairingCompletedWithError:(id)a3;
- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_readCharacteristicSignature:(id)a3;
- (void)_readCharacteristicSignatures;
- (void)_readCharacteristicValue:(id)a3;
- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_readDescriptorValue:(id)a3;
- (void)_readPendingDiscoveredCharacteritiscTypesWithCompletion:(id)a3;
- (void)_readServiceSignature:(id)a3;
- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4;
- (void)_removePairingOfAccessoryServerCancelledMidPairing;
- (void)_requestResponseForRequest:(id)a3;
- (void)_resetWithError:(id)a3;
- (void)_restartConnectionIdleTimer:(double)a3;
- (void)_resumeAllOperations;
- (void)_resumeConnectionIdleTimer;
- (void)_retryDiscovery;
- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4;
- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4;
- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5;
- (void)_suspendAllOperations;
- (void)_suspendConnectionIdleTimer;
- (void)_updateConnectionIdleTime:(unsigned __int8)a3;
- (void)_updatePropertiesFromCharacteristic:(id)a3;
- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)authSession:(id)a3 authComplete:(id)a4;
- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4;
- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5;
- (void)authenticateAccessory;
- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)connectWithCompletionHandler:(id)a3;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4;
- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5;
- (void)controlOutputStreamDidComplete:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)disconnectWithCompletionHandler:(id)a3;
- (void)disconnectWithCompletionHandler:(id)a3 disconnectionError:(id)a4;
- (void)discoverAccessories;
- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)getAccessoryInfo:(id)a3;
- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4;
- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3;
- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4;
- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)securitySession:(id)a3 didCloseWithError:(id)a4;
- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)securitySessionDidOpen:(id)a3;
- (void)securitySessionIsOpening:(id)a3;
- (void)setAccessoryCache:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticatedProtocolInfo:(id)a3;
- (void)setBadPairSetupCode:(BOOL)a3;
- (void)setConnectionCompletionHandler:(id)a3;
- (void)setConnectionIdleTimer:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDiscoveredAccessoryCharacteriticsPendingRead:(id)a3;
- (void)setDiscoveryContext:(id)a3;
- (void)setDiscoveryRetries:(int64_t)a3;
- (void)setEnhancedEncryption:(BOOL)a3;
- (void)setFeatureFlags:(unsigned __int8)a3;
- (void)setHasBeenDiscovered:(BOOL)a3;
- (void)setHasValidCache:(BOOL)a3;
- (void)setIdentifyCharacteristic:(id)a3;
- (void)setPairSetupBackoffTimeInterval:(double)a3;
- (void)setPairSetupCharacteristic:(id)a3;
- (void)setPairSetupSession:(id)a3;
- (void)setPairVerifyCharacteristic:(id)a3;
- (void)setPairing:(BOOL)a3;
- (void)setPairingDisconnectionError:(id)a3;
- (void)setPairingFeaturesCharacteristic:(id)a3;
- (void)setPairingsCharacteristic:(id)a3;
- (void)setSecuritySession:(id)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSetupCodeCompletionHandler:(id)a3;
- (void)setVerified:(BOOL)a3;
- (void)setWaitingForAuth:(BOOL)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)submitPairVerifyMetricWithError:(id)a3;
- (void)tearDownSessionOnAuthCompletion;
- (void)timerDidFire:(id)a3;
- (void)tryEstablishSecuritySession;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4;
@end

@implementation _HAPAccessoryServerBTLE200

- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  BOOL v96 = a8;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  v26 = v23;
  id v27 = a11;
  id v28 = a12;
  id v29 = a14;
  v30 = v27;
  id v31 = a15;
  v102.receiver = self;
  v102.super_class = (Class)_HAPAccessoryServerBTLE200;
  id v92 = a16;
  v94 = v31;
  v98 = v20;
  v32 = [(HAPAccessoryServerBTLE *)&v102 initWithPeripheral:v20 name:v21 pairingUsername:v22 statusFlags:v26 stateNumber:v24 enhancedEncryption:v96 connectReason:a9 configNumber:v25 category:v30 setupHash:v28 connectionIdleTime:a13 browser:v29 keyStore:v31 whbStableIdentifier:v92];
  if (!v32) {
    goto LABEL_13;
  }
  id v88 = v21;
  id v89 = v28;
  v95 = v30;
  uint64_t v33 = +[NSMutableArray array];
  pairingsCharacteristic = v32->_pairingsCharacteristic;
  v32->_pairingsCharacteristic = (HAPCharacteristic *)v33;

  uint64_t v35 = +[NSMutableArray array];
  requestOperationQueue = v32->_requestOperationQueue;
  v32->_requestOperationQueue = (NSOperationQueue *)v35;

  uint64_t v37 = +[NSMapTable weakToStrongObjectsMapTable];
  pendingResponses = v32->_pendingResponses;
  v32->_pendingResponses = (NSMutableArray *)v37;

  uint64_t v39 = +[NSMapTable weakToStrongObjectsMapTable];
  characteristicWriteCompletionHandlers = v32->_characteristicWriteCompletionHandlers;
  v32->_characteristicWriteCompletionHandlers = (NSMapTable *)v39;

  uint64_t v41 = +[NSMutableSet set];
  characteristicEnableEventCompletionHandlers = v32->_characteristicEnableEventCompletionHandlers;
  v32->_characteristicEnableEventCompletionHandlers = (NSMapTable *)v41;

  v32->_badPairSetupCode = v96;
  v32->_hasBeenDiscovered = 0;
  v32->_verified = 0;
  id v43 = objc_alloc_init((Class)NSOperationQueue);
  id v97 = v22;
  v91 = v29;
  id v44 = v25;
  v45 = +[NSString stringWithFormat:@"%s", sub_100017B60(v32, @"requestOperationQueue")];
  [v43 setName:v45];

  [v43 setMaxConcurrentOperationCount:1];
  [v43 setQualityOfService:25];
  v85 = v43;
  objc_storeStrong((id *)&v32->_pendingRequests, v43);
  id v46 = objc_alloc_init((Class)NSOperationQueue);
  id v47 = v24;
  v48 = +[NSString stringWithFormat:@"%s", sub_100017B60(v32, @"securitySessionOperationQueue")];
  [v46 setName:v48];

  [v46 setMaxConcurrentOperationCount:1];
  [v46 setQualityOfService:25];
  objc_storeStrong((id *)&v32->_pairVerifyCharacteristic, v46);
  id v49 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:0 options:15.0];
  id connectionCompletionHandler = v32->_connectionCompletionHandler;
  v32->_id connectionCompletionHandler = v49;

  [v32->_connectionCompletionHandler setDelegate:v32];
  id v51 = v32->_connectionCompletionHandler;
  v52 = [(HAPAccessoryServer *)v32 clientQueue];
  [v51 setDelegateQueue:v52];

  v53 = [v98 cbPeripheral];
  [v53 setDelegate:v32];

  v54 = [HAPBLEPeripheralInfo alloc];
  v55 = [v98 uniqueBTIdentifier];
  double Current = CFAbsoluteTimeGetCurrent();
  v57 = [v98 name];
  v90 = v44;
  v86 = v47;
  v87 = v26;
  v58 = [(HAPBLEPeripheralInfo *)v54 initWithPeripheralInfo:v55 advertisedProtocolVersion:2 previousProtocolVersion:2 resumeSessionId:0 lastSeen:v26 statusFlags:v47 stateNumber:Current configNumber:v44 categoryIdentifier:v30 accessoryName:v57];

  v59 = [v91 cachedAccessoryForIdentifier:v22];
  uint64_t v60 = [v59 metadataVersion];
  if (!v60) {
    goto LABEL_8;
  }
  v61 = (void *)v60;
  v62 = [v59 cachedServices];
  id v63 = [v62 count];
  if (!v90 || !v63)
  {

    goto LABEL_8;
  }
  v64 = [v59 peripheralInfo];
  [v64 configNumber];
  v66 = v65 = v58;
  unsigned __int8 v67 = [v66 isEqual:v90];

  v58 = v65;
  id v22 = v97;

  if ((v67 & 1) == 0)
  {
LABEL_8:
    objc_initWeak(&location, v32);
    v74 = [HAPBLEAccessoryCache alloc];
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_10004E3A0;
    v99[3] = &unk_100273880;
    objc_copyWeak(&v100, &location);
    id v28 = v89;
    v75 = [(HAPBLEAccessoryCache *)v74 initWithPairingIdentifier:v22 saveBlock:v99];

    objc_destroyWeak(&v100);
    objc_destroyWeak(&location);
    char v73 = 0;
    v59 = v75;
    goto LABEL_9;
  }
  v68 = [v59 peripheralInfo];
  v69 = [v68 broadcastKey];
  v70 = [v59 peripheralInfo];
  v71 = [v70 keyUpdatedStateNumber];
  v72 = [v59 peripheralInfo];
  [v72 keyUpdatedTime];
  -[HAPBLEPeripheralInfo saveBroadcastKey:keyUpdatedStateNumber:updatedTime:](v65, "saveBroadcastKey:keyUpdatedStateNumber:updatedTime:", v69, v71);

  v58 = v65;
  char v73 = 1;
  id v28 = v89;
LABEL_9:
  [v59 updateWithPeripheralInfo:v58];
  BYTE4(v32->super._blePeripheral) = v73;
  connectionState = (void *)v32->_connectionState;
  v32->_connectionState = (int64_t)v59;
  id v77 = v59;

  v78 = [v77 peripheralInfo];
  uint64_t v79 = [v78 accessoryName];
  v80 = (void *)v79;
  id v21 = v88;
  if (v79) {
    v81 = (void *)v79;
  }
  else {
    v81 = v88;
  }
  objc_storeStrong((id *)&v32->super.super._name, v81);

  id v82 = objc_alloc((Class)HMFVersion);
  id v83 = [v82 initWithMajorVersion:2 minorVersion:0 updateVersion:0];
  [(HAPAccessoryServer *)v32 setVersion:v83];

  [(_HAPAccessoryServerBTLE200 *)v32 _createPrimaryAccessoryFromAdvertisementData];
  v30 = v95;
  id v22 = v97;
  id v24 = v86;
  v26 = v87;
  id v25 = v90;
  id v29 = v91;
LABEL_13:

  return v32;
}

- (void)_resetWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543618;
    v53 = v7;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Resetting server with error: %@", buf, 0x16u);
  }
  [(HAPAccessoryServerBTLE *)v5 setNotifyingCharacteristicUpdated:0];
  id v8 = v4;
  v9 = v8;
  if (!v8)
  {
    if ([(_HAPAccessoryServerBTLE200 *)v5 isPairing]
      && ([(_HAPAccessoryServerBTLE200 *)v5 pairingDisconnectionError],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)v5 pairingDisconnectionError];
    }
    else
    {
      uint64_t v11 = +[NSError hapErrorWithcode:2 description:@"Cancelled." reason:@"Resetting the server." suggestion:0 underlyingError:0];
    }
    v9 = (void *)v11;
  }
  v40 = v8;
  [(_HAPAccessoryServerBTLE200 *)v5 _cancelAllQueuedOperationsWithError:v9];
  [(_HAPAccessoryServerBTLE200 *)v5 _resumeAllOperations];
  v12 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicWriteCompletionHandlers];
  v13 = [v12 keyEnumerator];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v19 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicWriteCompletionHandlers];
        id v20 = [v19 objectForKey:v18];

        if (v9)
        {
          id v21 = v5;
          id v22 = sub_100083F74();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = sub_100083FD0(v21);
            *(_DWORD *)buf = 138543874;
            v53 = v23;
            __int16 v54 = 2112;
            id v55 = v18;
            __int16 v56 = 2112;
            v57 = v9;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Calling write completion handler for %@ with error: %@", buf, 0x20u);
          }
        }
        ((void (**)(void, void *))v20)[2](v20, v9);
      }
      id v15 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v15);
  }

  id v24 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicWriteCompletionHandlers];
  [v24 removeAllObjects];

  id v25 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicEnableEventCompletionHandlers];
  v26 = [v25 keyEnumerator];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obja = v26;
  id v27 = [obja countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(obja);
        }
        id v31 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        v32 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicEnableEventCompletionHandlers];
        uint64_t v33 = [v32 objectForKey:v31];

        if (v9)
        {
          v34 = v5;
          uint64_t v35 = sub_100083F74();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = sub_100083FD0(v34);
            *(_DWORD *)buf = 138543874;
            v53 = v36;
            __int16 v54 = 2112;
            id v55 = v31;
            __int16 v56 = 2112;
            v57 = v9;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Calling enable event completion handler for %@ with error: %@", buf, 0x20u);
          }
        }
        ((void (**)(void, void *))v33)[2](v33, v9);
      }
      id v28 = [obja countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v28);
  }

  uint64_t v37 = [(_HAPAccessoryServerBTLE200 *)v5 characteristicEnableEventCompletionHandlers];
  [v37 removeAllObjects];

  [(_HAPAccessoryServerBTLE200 *)v5 _cancelDiscoveryWithError:v40];
  if ([(_HAPAccessoryServerBTLE200 *)v5 isPairing]) {
    [(_HAPAccessoryServerBTLE200 *)v5 _pairingCompletedWithError:v9];
  }
  v38 = [(_HAPAccessoryServerBTLE200 *)v5 pairSetupSession];
  [(_HAPAccessoryServerBTLE200 *)v5 setPairSetupSession:0];
  [v38 stop];
  uint64_t v39 = [(_HAPAccessoryServerBTLE200 *)v5 securitySession];
  [(_HAPAccessoryServerBTLE200 *)v5 setSecuritySession:0];
  [v39 close];
  [(_HAPAccessoryServerBTLE200 *)v5 setDiscoveryRetries:0];
}

- (void)dealloc
{
  v3 = [(HAPAccessoryServerBTLE *)self peripheral];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)_HAPAccessoryServerBTLE200;
  [(_HAPAccessoryServerBTLE200 *)&v4 dealloc];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HAPAccessoryServerBTLE *)self shortDescription];
  if (v3)
  {
    v6 = +[NSString stringWithFormat:@" %p", self];
  }
  else
  {
    v6 = &stru_10027B0E8;
  }
  [(HAPAccessoryServer *)self hasPairings];
  v7 = HMFBooleanToString();
  id v8 = [(HAPAccessoryServerBTLE *)self peripheral];
  v9 = +[NSString stringWithFormat:@"<%@%@, hasPairings = %@, Peripheral = %@>", v5, v6, v7, v8];

  if (v3) {

  }
  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)[(_HAPAccessoryServerBTLE200 *)self descriptionWithPointer:1];
}

- (NSString)description
{
  return (NSString *)[(_HAPAccessoryServerBTLE200 *)self descriptionWithPointer:0];
}

- (BOOL)hasValidCache
{
  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = BYTE4(v2->super._blePeripheral);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasValidCache:(BOOL)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  BYTE4(self->super._blePeripheral) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasBeenDiscovered
{
  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = BYTE5(v2->super._blePeripheral);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenDiscovered:(BOOL)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  BYTE5(self->super._blePeripheral) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hapBLEProtocolVersion
{
  return 2;
}

- (void)_createPrimaryAccessoryFromAdvertisementData
{
  BOOL v3 = [HAPAccessory alloc];
  objc_super v4 = +[NSNumber numberWithUnsignedInteger:1];
  v5 = [(HAPAccessory *)v3 initWithServer:self instanceID:v4];

  v6 = [(HAPAccessoryServer *)self name];
  [(HAPAccessory *)v5 setName:v6];

  v7 = [(HAPAccessoryServer *)self identifier];
  [(HAPAccessory *)v5 setIdentifier:v7];

  id v8 = [(HAPAccessoryServer *)self identifier];
  [(HAPAccessory *)v5 setServerIdentifier:v8];

  [(HAPAccessoryServer *)self setPrimaryAccessory:v5];
  v10 = v5;
  v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(HAPAccessoryServer *)self setAccessories:v9];
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  objc_super v4 = [(HAPAccessoryServer *)self delegate];
  if (v4)
  {
    v5 = [(HAPAccessoryServer *)self delegateQueue];
    if (v5)
    {
      v6 = [(HAPAccessoryServer *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)_serviceForCBService:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [(HAPAccessoryServer *)self accessories];
  id v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v9 = [v8 services:v19];
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              id v15 = [v14 cbService];
              unsigned __int8 v16 = [v15 isEqual:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      id v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)_characteristicForCBCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [v4 service];
  uint64_t v6 = [(_HAPAccessoryServerBTLE200 *)self _serviceForCBService:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v7 = [v6 characteristics];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 cbCharacteristic];
        unsigned __int8 v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_removePairingOfAccessoryServerCancelledMidPairing
{
  if ((id)[(HAPAccessoryServer *)self pendingRemovePairing] == (id)1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004F284;
    v8[3] = &unk_1002736C0;
    v8[4] = self;
    BOOL v3 = objc_retainBlock(v8);
    id v4 = [(HAPAccessoryServer *)self clientQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004F3B8;
    v6[3] = &unk_100273460;
    id v7 = v3;
    v5 = v3;
    [(_HAPAccessoryServerBTLE200 *)self removePairingForCurrentControllerOnQueue:v4 completion:v6 serverPairingCompletion:v5];
  }
}

- (void)discoverAccessories
{
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F48C;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_readPendingDiscoveredCharacteritiscTypesWithCompletion:(id)a3
{
  long long v28 = (void (**)(void))a3;
  id v4 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(_HAPAccessoryServerBTLE200 *)self discoveredAccessoryCharacteriticsPendingRead];
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    CFStringRef v26 = @"FED3";
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unsigned int v10 = [v9 isEqualToString:@"00000023-0000-1000-8000-4D69736D6574" v26];
        id v11 = [(HAPAccessoryServer *)self primaryAccessory];
        uint64_t v12 = v11;
        if (!v10)
        {
          id v14 = [v11 characteristicsOfType:v9];
          unsigned __int8 v13 = [v14 firstObject];

LABEL_10:
          if (!v13) {
            continue;
          }
          goto LABEL_11;
        }
        unsigned __int8 v13 = [v11 characteristicOfType:v9 serviceType:@"0000003E-0000-1000-8000-4D69736D6574"];

        if (!v13)
        {
          uint64_t v12 = [(HAPAccessoryServer *)self primaryAccessory];
          unsigned __int8 v13 = [v12 characteristicOfType:v9 serviceType:v26];
          goto LABEL_10;
        }
LABEL_11:
        [v4 addObject:v13];
      }
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v6);
  }

  long long v15 = [(_HAPAccessoryServerBTLE200 *)self discoveredAccessoryCharacteriticsPendingRead];
  [v15 removeAllObjects];

  if ([v4 count])
  {
    long long v16 = self;
    long long v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = sub_100083FD0(v16);
      *(_DWORD *)buf = 138543618;
      long long v43 = v18;
      __int16 v44 = 2112;
      long long v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Reading pending discovered characteristics with types: %@", buf, 0x16u);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = [v4 copy];
    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100050104;
          v29[3] = &unk_100273920;
          id v30 = v4;
          uint64_t v31 = v24;
          v32 = v28;
          [(_HAPAccessoryServerBTLE200 *)v16 _readValueForCharacteristic:v24 options:1 completionHandler:v29];
        }
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    long long v25 = v28;
  }
  else
  {
    long long v25 = v28;
    v28[2](v28);
  }
}

- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSDate date];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100050490;
  v23[3] = &unk_100273970;
  objc_copyWeak(v26, &location);
  id v8 = v7;
  id v24 = v8;
  v26[1] = (id)a3;
  id v9 = v6;
  id v25 = v9;
  unsigned int v10 = objc_retainBlock(v23);
  id v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  unsigned int v12 = [v11 isDiscovering];

  if (v12)
  {
    unsigned __int8 v13 = self;
    sub_100083F74();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_100083FD0(v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      long long v16 = [(_HAPAccessoryServerBTLE200 *)v13 discoveryContext];
      long long v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 discoveryType]);
      *(_DWORD *)buf = 138543618;
      id v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@The server already has a discovery in progress for type: %@", buf, 0x16u);
    }
    long long v18 = +[NSError hapErrorWithcode:4];
    ((void (*)(void *, _HAPBTLEDiscoveryContext *))v10[2])(v10, v18);
  }
  else
  {
    id v19 = [[_HAPBTLEDiscoveryContext alloc] initWithDiscoveryType:a3];
    [(_HAPBTLEDiscoveryContext *)v19 setCompletionHandler:v10];
    [(_HAPBTLEDiscoveryContext *)v19 setDiscovering:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005079C;
    v20[3] = &unk_100273998;
    v20[4] = self;
    int64_t v22 = a3;
    long long v18 = v19;
    id v21 = v18;
    [(_HAPAccessoryServerBTLE200 *)self connectWithCompletionHandler:v20];
  }
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (BOOL)_cancelDiscoveryWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (!v5)
  {
LABEL_25:
    BOOL v28 = 0;
    goto LABEL_26;
  }
  id v6 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
  uint64_t v7 = [v6 lastKeyBagIdentityIndexFailingPV];
  if (v7)
  {
    id v8 = [(HAPAccessoryServer *)self keyBag];
    id v9 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
    unsigned int v10 = [v9 lastKeyBagIdentityIndexFailingPV];
    unsigned int v11 = [v8 isValidIndex:((char *)[v10 integerValue]) + 1];
  }
  else
  {
    unsigned int v11 = 0;
  }

  if ([(_HAPAccessoryServerBTLE200 *)self discoveryRetries] < 2) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  unsigned int v13 = [(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v4];
  id v14 = self;
  id v15 = sub_100083F74();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v13 && v12)
  {
    if (v16)
    {
      long long v17 = sub_100083FD0(v14);
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      __int16 v43 = 2112;
      id v44 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring cancel discovery request due to BTLE sudden disconnection: %@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (v16)
  {
    long long v18 = sub_100083FD0(v14);
    id v19 = [(_HAPAccessoryServerBTLE200 *)v14 discoveryContext];
    *(_DWORD *)buf = 138543874;
    v42 = v18;
    __int16 v43 = 2048;
    id v44 = [v19 discoveryType];
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %tu cancelled with error: %@", buf, 0x20u);
  }
  if (!v4)
  {
    id v29 = +[NSError hapErrorWithcode:2 description:@"Discovery failed." reason:@"Cancelled." suggestion:0 underlyingError:0];
LABEL_22:
    __int16 v30 = v29;
    uint64_t v31 = [(_HAPAccessoryServerBTLE200 *)v14 discoveryContext];
    v32 = [v31 completionHandler];

    if (v32)
    {
      long long v33 = [(HAPAccessoryServer *)v14 clientQueue];
      long long v35 = _NSConcreteStackBlock;
      uint64_t v36 = 3221225472;
      long long v37 = sub_100050F20;
      long long v38 = &unk_1002733F0;
      id v40 = v32;
      id v39 = v30;
      dispatch_async(v33, &v35);
    }
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v14, "setDiscoveryContext:", 0, v35, v36, v37, v38);

    goto LABEL_25;
  }
  id v20 = [v4 domain];
  unsigned int v21 = [v20 isEqualToString:CBErrorDomain] & v12;

  if (v21 != 1)
  {
    [(_HAPAccessoryServerBTLE200 *)v14 setHasValidCache:0];
    id v29 = v4;
    goto LABEL_22;
  }
  int64_t v22 = v14;
  long long v23 = sub_100083F74();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = sub_100083FD0(v22);
    id v25 = [(_HAPAccessoryServerBTLE200 *)v22 discoveryContext];
    id v26 = [v25 discoveryType];
    id v27 = [(_HAPAccessoryServerBTLE200 *)v22 discoveryRetries];
    *(_DWORD *)buf = 138544130;
    v42 = v24;
    __int16 v43 = 2048;
    id v44 = v26;
    __int16 v45 = 2048;
    id v46 = v27;
    __int16 v47 = 1024;
    int v48 = 2;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}@Reconnecting and restarting attribute database discovery type: %tu due to a connection error. Current retries, %tu, max retries, %d.", buf, 0x26u);
  }
  [(_HAPAccessoryServerBTLE200 *)v22 _retryDiscovery];
  BOOL v28 = 1;
LABEL_26:

  return v28;
}

- (void)_retryDiscovery
{
  BOOL v3 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (v3)
  {
    id v4 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    [v4 reset];

    [(_HAPAccessoryServerBTLE200 *)self setDiscoveryRetries:(char *)[(_HAPAccessoryServerBTLE200 *)self discoveryRetries] + 1];
    id v5 = [(_HAPAccessoryServerBTLE200 *)self pairVerifyOperationQueue];
    id v6 = +[NSError hapErrorWithcode:27];
    [v5 cancelAllOperationsWithError:v6];

    uint64_t v7 = +[NSError hapErrorWithcode:27];
    [(_HAPAccessoryServerBTLE200 *)self _cancelAllQueuedOperationsWithError:v7];

    [(_HAPAccessoryServerBTLE200 *)self _resumeAllOperations];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100051074;
    v8[3] = &unk_100273018;
    v8[4] = self;
    sub_100051074((uint64_t)v8);
    [(_HAPAccessoryServerBTLE200 *)self setDiscoveryContext:0];
    [(_HAPAccessoryServerBTLE200 *)self discoverAccessoriesAndReadCharacteristicTypes:0];
  }
}

- (void)_handleCompletedDiscovery
{
  BOOL v3 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (!v3) {
    return;
  }
  id v4 = self;
  id v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = sub_100083FD0(v4);
    uint64_t v7 = [(_HAPAccessoryServerBTLE200 *)v4 discoveryContext];
    *(_DWORD *)buf = 138543618;
    v99 = v6;
    __int16 v100 = 2048;
    v101 = (_HAPAccessoryServerBTLE200 *)[v7 discoveryType];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %tu completed.", buf, 0x16u);
  }
  unsigned __int8 v8 = [(_HAPAccessoryServerBTLE200 *)v4 hasValidCache];
  id v9 = v4;
  unsigned int v10 = sub_100083F74();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      int v12 = sub_100083FD0(v9);
      unsigned int v13 = [(_HAPAccessoryServerBTLE200 *)v9 accessoryCache];
      id v14 = [v13 peripheralInfo];
      *(_DWORD *)buf = 138543618;
      v99 = v12;
      __int16 v100 = 2112;
      v101 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Constructing attribute database from cache %@", buf, 0x16u);
    }
    id v15 = [(_HAPAccessoryServerBTLE200 *)v9 _hapServicesFromCache];
    BOOL v16 = v9;
    long long v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = sub_100083FD0(v16);
      *(_DWORD *)buf = 138543618;
      v99 = v18;
      __int16 v100 = 2112;
      v101 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database with cached services: %@", buf, 0x16u);
    }
    if (v15 && [(_HAPAccessoryServerBTLE200 *)v15 count])
    {
      int64_t v19 = +[HAPBLEAccessoryCache currentDiscoveryVersion];
      id v20 = [(_HAPAccessoryServerBTLE200 *)v16 accessoryCache];
      [v20 setDiscoveryVersion:v19];

      unsigned int v21 = [(HAPAccessoryServerBTLE *)v16 browser];
      int64_t v22 = [(_HAPAccessoryServerBTLE200 *)v16 accessoryCache];
      [v21 saveCacheToDisk:v22];
    }
    else
    {
      v96[0] = NSLocalizedDescriptionKey;
      unsigned __int8 v67 = +[NSString stringWithFormat:@"Failed att-db construction from cache"];
      v97[0] = v67;
      v96[1] = NSLocalizedFailureReasonErrorKey;
      v68 = +[NSBundle mainBundle];
      v69 = [v68 localizedStringForKey:@"Unable to find matching CB service / characteristic" value:&stru_10027B0E8 table:0];
      v97[1] = v69;
      unsigned int v21 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];

      int64_t v22 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6727 userInfo:v21];
      [(_HAPAccessoryServerBTLE200 *)v16 _cancelDiscoveryWithError:v22];
      v70 = [(HAPAccessoryServerBTLE *)v16 browser];
      v71 = [(_HAPAccessoryServerBTLE200 *)v16 accessoryCache];
      v72 = [v71 pairingIdentifier];
      [v70 removeCachedAccessoryWithIdentifier:v72];

      [(_HAPAccessoryServerBTLE200 *)v16 setHasValidCache:0];
      char v73 = v16;
      v74 = sub_100083F74();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v75 = sub_100083FD0(v73);
        [(_HAPAccessoryServerBTLE200 *)v73 accessoryCache];
        v76 = v9;
        id v77 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v75;
        __int16 v100 = 2112;
        v101 = v77;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Att-db mismatch removing the cached accessory: %@", buf, 0x16u);

        id v9 = v76;
      }
    }
    id v55 = [(HAPAccessoryServer *)v16 primaryAccessory];
    id v78 = [(_HAPAccessoryServerBTLE200 *)v15 copy];
    [v55 setServices:v78];

    goto LABEL_52;
  }
  if (v11)
  {
    long long v23 = sub_100083FD0(v9);
    *(_DWORD *)buf = 138543362;
    v99 = v23;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database parsing", buf, 0xCu);
  }
  id v24 = [(HAPAccessoryServerBTLE *)v9 peripheral];
  id v25 = [v24 services];
  id v26 = [v25 copy];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v26 count]);
  v85 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v15 = (_HAPAccessoryServerBTLE200 *)v26;
  id v27 = [(_HAPAccessoryServerBTLE200 *)v15 countByEnumeratingWithState:&v92 objects:v104 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v93;
    v86 = v15;
    uint64_t v87 = *(void *)v93;
    do
    {
      __int16 v30 = 0;
      do
      {
        if (*(void *)v93 != v29) {
          objc_enumerationMutation(v15);
        }
        uint64_t v31 = *(_HAPAccessoryServerBTLE200 **)(*((void *)&v92 + 1) + 8 * (void)v30);
        if ([(id)objc_opt_class() isHAPService:v31])
        {
          v32 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
          id v33 = [v32 discoveryType];

          if (v33 == (id)1)
          {
            long long v34 = [(_HAPAccessoryServerBTLE200 *)v31 UUID];
            long long v35 = +[CBUUID UUIDWithString:@"FED3"];
            if (([v34 isEqual:v35] & 1) == 0)
            {
              uint64_t v36 = [(_HAPAccessoryServerBTLE200 *)v31 UUID];
              long long v37 = +[CBUUID UUIDWithString:@"0000003E-0000-1000-8000-4D69736D6574"];
              unsigned __int8 v38 = [v36 isEqual:v37];

              id v15 = v86;
              if ((v38 & 1) == 0)
              {
                id v39 = v9;
                id v40 = sub_100083F74();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  uint64_t v41 = sub_100083FD0(v39);
                  *(_DWORD *)buf = 138543618;
                  v99 = v41;
                  __int16 v100 = 2112;
                  v101 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Identify discovery: %@", buf, 0x16u);
                }
                goto LABEL_36;
              }
LABEL_30:
              id v91 = 0;
              id v40 = [(_HAPAccessoryServerBTLE200 *)v9 _parseService:v31 error:&v91];
              id v39 = (_HAPAccessoryServerBTLE200 *)v91;
              if (v40)
              {
                id v46 = [(HAPAccessoryServer *)v9 primaryAccessory];
                [v40 setAccessory:v46];

                [(_HAPAccessoryServerBTLE200 *)v85 addObject:v40];
              }
              else
              {
                __int16 v47 = v9;
                int v48 = sub_100083F74();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  long long v49 = sub_100083FD0(v47);
                  *(_DWORD *)buf = 138543618;
                  v99 = v49;
                  __int16 v100 = 2112;
                  v101 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse service with error: %@", buf, 0x16u);
                }
                id v15 = v86;
              }
LABEL_35:
              uint64_t v29 = v87;
              goto LABEL_36;
            }
          }
          else
          {
            v42 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
            id v43 = [v42 discoveryType];

            if (v43 != (id)2) {
              goto LABEL_30;
            }
            long long v34 = [(_HAPAccessoryServerBTLE200 *)v31 UUID];
            long long v35 = +[CBUUID UUIDWithString:@"FED4"];
            if (([v34 isEqual:v35] & 1) == 0)
            {
              id v44 = [(_HAPAccessoryServerBTLE200 *)v31 UUID];
              __int16 v45 = +[CBUUID UUIDWithString:@"00000010-0000-1000-8000-4D69736D6574"];
              if (([v44 isEqual:v45] & 1) == 0)
              {
                long long v50 = [(_HAPAccessoryServerBTLE200 *)v31 UUID];
                +[CBUUID UUIDWithString:@"000000A2-0000-1000-8000-4D69736D6574"];
                v52 = id v51 = v9;
                unsigned __int8 v84 = [v50 isEqual:v52];

                id v9 = v51;
                uint64_t v29 = v87;

                id v15 = v86;
                if (v84) {
                  goto LABEL_30;
                }
                id v39 = v9;
                id v40 = sub_100083F74();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  v53 = sub_100083FD0(v39);
                  *(_DWORD *)buf = 138543618;
                  v99 = v53;
                  __int16 v100 = 2112;
                  v101 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Pairing discovery: %@", buf, 0x16u);

                  goto LABEL_35;
                }
LABEL_36:

                goto LABEL_37;
              }

              id v15 = v86;
            }
          }

          goto LABEL_30;
        }
LABEL_37:
        __int16 v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v54 = [(_HAPAccessoryServerBTLE200 *)v15 countByEnumeratingWithState:&v92 objects:v104 count:16];
      id v28 = v54;
    }
    while (v54);
  }

  id v55 = v85;
  id v56 = [(_HAPAccessoryServerBTLE200 *)v85 count];
  v57 = v9;
  v58 = sub_100083F74();
  v59 = v58;
  if (!v56)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      id v83 = sub_100083FD0(v57);
      *(_DWORD *)buf = 138543362;
      v99 = v83;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@Attribute database parsing failed due to missing compatible services", buf, 0xCu);
    }
    uint64_t v79 = +[NSError hapErrorWithcode:3 description:@"Peripheral missing services" reason:0 suggestion:0 underlyingError:0];
    goto LABEL_53;
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    uint64_t v60 = sub_100083FD0(v57);
    v61 = [(_HAPAccessoryServerBTLE200 *)v57 discoveryContext];
    id v62 = [v61 discoveryType];
    *(_DWORD *)buf = 138543874;
    v99 = v60;
    __int16 v100 = 2112;
    v101 = v85;
    __int16 v102 = 2048;
    id v103 = v62;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database parsing with parsed services: %@, type: %tu", buf, 0x20u);
  }
  id v63 = [(HAPAccessoryServer *)v57 primaryAccessory];
  id v64 = [(_HAPAccessoryServerBTLE200 *)v85 copy];
  [v63 setServices:v64];

  v65 = [(_HAPAccessoryServerBTLE200 *)v57 discoveryContext];
  id v66 = [v65 discoveryType];

  if (!v66)
  {
    [(_HAPAccessoryServerBTLE200 *)v57 setVerified:1];
    [(_HAPAccessoryServerBTLE200 *)v57 _cacheServices:v85];
  }
LABEL_52:
  uint64_t v79 = 0;
LABEL_53:

  v80 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
  v81 = [v80 completionHandler];

  if (v81)
  {
    id v82 = [(HAPAccessoryServer *)v9 clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051DFC;
    block[3] = &unk_1002733F0;
    id v90 = v81;
    id v89 = v79;
    dispatch_async(v82, block);
  }
  [(_HAPAccessoryServerBTLE200 *)v9 setDiscoveryContext:0];
}

- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5
{
  long long v23 = self;
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  id v9 = +[CBUUID UUIDWithNSUUID:v7];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned int v10 = [v8 characteristics];
  id v11 = [(_HAPAccessoryServerBTLE200 *)v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v16 = [v15 UUID:v23];
        unsigned __int8 v17 = [v16 isEqual:v9];

        if (v17)
        {
          id v21 = v15;
          int64_t v19 = v24;
          goto LABEL_13;
        }
      }
      id v12 = [(_HAPAccessoryServerBTLE200 *)v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  unsigned int v10 = v23;
  long long v18 = sub_100083F74();
  int64_t v19 = v24;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v20 = sub_100083FD0(v10);
    *(_DWORD *)buf = 138543874;
    __int16 v30 = v20;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: NO CB Characteristic for : %@/%@", buf, 0x20u);
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4
{
  id v29 = a3;
  id v5 = +[CBUUID UUIDWithNSUUID:](CBUUID, "UUIDWithNSUUID:");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = self;
  id v6 = [(HAPAccessoryServerBTLE *)self peripheral];
  id v7 = [v6 services];
  id v8 = [v7 copy];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unsigned int v16 = [(id)objc_opt_class() isHAPService:v15];
        unsigned __int8 v17 = [v15 UUID];
        unsigned int v18 = [v17 isEqual:v5];

        if (v18)
        {
          id v19 = v15;

          id v11 = v19;
        }
        v12 += v16;
        id v20 = [v15 UUID];
        unsigned int v21 = [v20 isEqual:v5];

        if (v21) {
          BOOL v22 = v12 == a4;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22)
        {
          id v23 = v15;

          id v24 = v29;
          goto LABEL_20;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  long long v25 = v32;
  long long v26 = sub_100083F74();
  id v24 = v29;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    long long v27 = sub_100083FD0(v25);
    *(_DWORD *)buf = 138544130;
    unsigned __int8 v38 = v27;
    __int16 v39 = 2112;
    id v40 = v11;
    __int16 v41 = 2112;
    id v42 = v29;
    __int16 v43 = 2048;
    unint64_t v44 = a4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: Returning first instance %@ Service for : %@/%tu", buf, 0x2Au);
  }
  id v11 = v11;
  id v23 = v11;
LABEL_20:

  return v23;
}

- (id)_getCachedService:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
  id v6 = [v5 cachedServices];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 serviceUUID];
        unsigned __int8 v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_hapServicesFromCache
{
  BOOL v3 = &_sSayxGSEsSERzlMc_ptr;
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  id v63 = self;
  id v6 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v7 = [v6 discoveryType];

  if (v7 == (id)2)
  {
    id v10 = objc_alloc((Class)NSUUID);
    id v11 = &off_100274588;
  }
  else
  {
    if (v7 != (id)1)
    {
      if (v7) {
        goto LABEL_10;
      }
      uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)v63 accessoryCache];
      id v9 = [v8 cachedServices];
      [v4 addObjectsFromArray:v9];

      goto LABEL_9;
    }
    id v10 = objc_alloc((Class)NSUUID);
    id v11 = &off_100274580;
  }
  id v12 = [v10 initWithUUIDString:*v11];
  uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)v63 _getCachedService:v12];

  if (!v8) {
    goto LABEL_10;
  }
  [v4 addObject:v8];
LABEL_9:

LABEL_10:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v69;
    id v56 = v13;
    v57 = v5;
    uint64_t v52 = *(void *)v69;
    while (2)
    {
      uint64_t v17 = 0;
      id v53 = v15;
      do
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v18 = *(void **)(*((void *)&v68 + 1) + 8 * v17);
        id v19 = [v18 serviceUUID];
        -[_HAPAccessoryServerBTLE200 _getCBService:instanceOrder:](v63, "_getCBService:instanceOrder:", v19, [v18 serviceInstanceOrder]);
        id v20 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          id v20 = v63;
          __int16 v47 = sub_100083F74();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            long long v50 = sub_100083FD0(v20);
            *(_DWORD *)buf = 138543618;
            v74 = v50;
            __int16 v75 = 2112;
            v76 = v18;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb service for %@", buf, 0x16u);
          }
LABEL_32:

          id v44 = 0;
          goto LABEL_33;
        }
        uint64_t v55 = v17;
        unsigned int v21 = [v3[148] array];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v54 = v18;
        id obj = [v18 cachedCharacteristics];
        id v62 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v62)
        {
          uint64_t v59 = *(void *)v65;
          uint64_t v60 = v21;
          v61 = v20;
          while (2)
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v65 != v59) {
                objc_enumerationMutation(obj);
              }
              id v23 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              id v24 = [HAPCharacteristic alloc];
              long long v25 = [v23 characteristicUUID];
              long long v26 = [v25 UUIDString];
              long long v27 = [v23 characteristicInstanceId];
              long long v28 = [(HAPAccessoryServerBTLE *)v63 stateNumber];
              id v29 = [v23 characteristicProperties];
              __int16 v30 = [v23 characteristicMetadata];
              LOBYTE(v51) = 1;
              __int16 v31 = [(HAPCharacteristic *)v24 initWithType:v26 instanceID:v27 value:0 stateNumber:v28 properties:v29 eventNotificationsEnabled:0 implicitWriteWithResponse:v51 metadata:v30];

              id v32 = [v23 characteristicUUID];
              long long v33 = [v23 characteristicInstanceId];
              id v20 = v61;
              long long v34 = [(_HAPAccessoryServerBTLE200 *)v63 _getCBCharacteristic:v32 instanceId:v33 service:v61];

              if (!v31)
              {
                __int16 v45 = v63;
                id v46 = sub_100083F74();
                __int16 v47 = v60;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  int v48 = sub_100083FD0(v45);
                  *(_DWORD *)buf = 138543618;
                  v74 = v48;
                  __int16 v75 = 2112;
                  v76 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb characteristic for %@", buf, 0x16u);
                }
                id v13 = v56;
                id v5 = v57;
                goto LABEL_32;
              }
              long long v35 = +[NSDate distantPast];
              [(HAPCharacteristic *)v31 setValueUpdatedTime:v35];

              [(HAPCharacteristic *)v31 setCBCharacteristic:v34];
              unsigned int v21 = v60;
              [v60 addObject:v31];
            }
            id v62 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
            if (v62) {
              continue;
            }
            break;
          }
        }

        long long v36 = [HAPService alloc];
        long long v37 = [v54 serviceUUID];
        unsigned __int8 v38 = [v37 UUIDString];
        __int16 v39 = [v54 serviceInstanceId];
        id v40 = [v54 serviceProperties];
        __int16 v41 = [v54 linkedServices];
        id v42 = [(HAPService *)v36 initWithType:v38 instanceID:v39 parsedCharacteristics:v21 serviceProperties:v40 linkedServices:v41];

        id v5 = v57;
        if (v42)
        {
          __int16 v43 = [(HAPAccessoryServer *)v63 primaryAccessory];
          [(HAPService *)v42 setAccessory:v43];

          [(HAPService *)v42 setCBService:v20];
          [v57 addObject:v42];
        }

        id v13 = v56;
        uint64_t v17 = v55 + 1;
        uint64_t v16 = v52;
        BOOL v3 = &_sSayxGSEsSERzlMc_ptr;
      }
      while ((id)(v55 + 1) != v53);
      id v15 = [v56 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v44 = v5;
LABEL_33:

  return v44;
}

- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [HAPBLEServiceCache alloc];
  id v7 = objc_alloc((Class)NSUUID);
  uint64_t v8 = [v5 type];
  id v9 = [v7 initWithUUIDString:v8];
  id v10 = [v5 instanceID];
  id v11 = [v5 serviceProperties];
  id v12 = [v5 linkedServices];
  id v13 = [(HAPBLEServiceCache *)v6 initWithServiceUUID:v9 instanceId:v10 instanceOrder:a4 serviceProperties:v11 linkedServices:v12];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = v5;
  id obj = [v5 characteristics];
  id v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        unsigned int v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v19 = [HAPBLECharacteristicCache alloc];
        id v20 = objc_alloc((Class)NSUUID);
        unsigned int v21 = [v18 type];
        id v22 = [v20 initWithUUIDString:v21];
        id v23 = [v18 instanceID];
        id v24 = [v18 properties];
        long long v25 = [v18 accessoryMetadata];
        long long v26 = [(HAPBLECharacteristicCache *)v19 initWithCharacteristicUUID:v22 instanceId:v23 characteristicProperties:v24 characteristicMetadata:v25];

        [(HAPBLEServiceCache *)v13 updateWithCharacteristic:v26];
      }
      id v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  return v13;
}

- (void)_cacheServices:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)v5 accessoryCache];
    *(_DWORD *)buf = 138543618;
    long long v31 = v7;
    __int16 v32 = 2112;
    long long v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: current Cache : %@", buf, 0x16u);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = 1;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = -[_HAPAccessoryServerBTLE200 _serviceCacheFromHAPService:serviceOrder:](v5, "_serviceCacheFromHAPService:serviceOrder:", *(void *)(*((void *)&v25 + 1) + 8 * (void)v14), (char *)v14 + v13, (void)v25);
        uint64_t v16 = [(_HAPAccessoryServerBTLE200 *)v5 accessoryCache];
        [v16 updateWithService:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      v13 += (uint64_t)v14;
    }
    while (v11);
  }

  int64_t v17 = +[HAPBLEAccessoryCache currentDiscoveryVersion];
  unsigned int v18 = [(_HAPAccessoryServerBTLE200 *)v5 accessoryCache];
  [v18 setDiscoveryVersion:v17];

  id v19 = [(HAPAccessoryServerBTLE *)v5 browser];
  id v20 = [(_HAPAccessoryServerBTLE200 *)v5 accessoryCache];
  [v19 saveCacheToDisk:v20];

  [(_HAPAccessoryServerBTLE200 *)v5 setHasValidCache:1];
  unsigned int v21 = v5;
  id v22 = sub_100083F74();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = sub_100083FD0(v21);
    id v24 = [(_HAPAccessoryServerBTLE200 *)v21 accessoryCache];
    *(_DWORD *)buf = 138543618;
    long long v31 = v23;
    __int16 v32 = 2112;
    long long v33 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Saved Valid Cache : %@", buf, 0x16u);
  }
}

- (void)_discoverServices
{
  id v2 = [(HAPAccessoryServerBTLE *)self peripheral];
  [v2 discoverServices:0];
}

- (void)_handleDiscoveredServices:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (!a4)
  {
    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v6;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v7) {
      goto LABEL_27;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    while (1)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
        if ([(id)objc_opt_class() isHAPService:v11])
        {
          uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          id v13 = [v12 discoveryType];

          if (v13 == (id)1)
          {
            id v14 = [v11 UUID];
            id v15 = +[CBUUID UUIDWithString:@"FED3"];
            if ([v14 isEqual:v15])
            {

LABEL_26:
              [(_HAPAccessoryServerBTLE200 *)self _discoverCharacteristicsForService:v11];
              goto LABEL_27;
            }
            uint64_t v16 = [v11 UUID];
            int64_t v17 = +[CBUUID UUIDWithString:@"0000003E-0000-1000-8000-4D69736D6574"];
            unsigned int v18 = [v16 isEqual:v17];

            if (v18) {
              goto LABEL_26;
            }
          }
          else
          {
            id v19 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
            id v20 = [v19 discoveryType];

            if (v20 != (id)2) {
              goto LABEL_18;
            }
            unsigned int v21 = [v11 UUID];
            id v22 = +[CBUUID UUIDWithString:@"FED4"];
            if ([v21 isEqual:v22]) {
              goto LABEL_17;
            }
            id v23 = [v11 UUID];
            id v24 = +[CBUUID UUIDWithString:@"00000010-0000-1000-8000-4D69736D6574"];
            if ([v23 isEqual:v24])
            {

LABEL_17:
LABEL_18:
              [(_HAPAccessoryServerBTLE200 *)self _discoverCharacteristicsForService:v11];
              goto LABEL_19;
            }
            [v11 UUID];
            long long v25 = v29 = v23;
            long long v26 = +[CBUUID UUIDWithString:@"000000A2-0000-1000-8000-4D69736D6574"];
            unsigned __int8 v30 = [v25 isEqual:v26];

            if (v30) {
              goto LABEL_18;
            }
          }
        }
LABEL_19:
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v8 = v27;
      if (!v27)
      {
LABEL_27:

        id v6 = v28;
        goto LABEL_28;
      }
    }
  }
  [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:a4];
LABEL_28:
}

- (void)_discoverCharacteristicsForService:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100083FD0(v5);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Discovering service: %@", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [(_HAPAccessoryServerBTLE200 *)v5 discoveryContext];
  uint64_t v9 = [v8 discoveringServices];
  [v9 addObject:v4];

  id v10 = [(HAPAccessoryServerBTLE *)v5 peripheral];
  [v10 discoverCharacteristics:0 forService:v4];
}

- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:a4];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    if ([(id)objc_opt_class() isHAPService:v6]
      && ![(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = [v6 characteristics];
      id v16 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v10);
            }
            id v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (sub_100053728(v20))
            {
              [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicValue:v20];
              goto LABEL_8;
            }
          }
          id v17 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v7 = self;
      id v8 = sub_100083F74();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = sub_100083FD0(v7);
        *(_DWORD *)buf = 138543618;
        long long v26 = v9;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Removing Service: %@ from discovery context", buf, 0x16u);
      }
      id v10 = [(_HAPAccessoryServerBTLE200 *)v7 discoveryContext];
      int v11 = [v10 discoveringServices];
      [v11 removeObject:v6];
    }
LABEL_8:

    if (![(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      unsigned int v13 = [v12 isComplete];

      if (v13) {
        [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
      }
    }
    if ([(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      id v14 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      unsigned int v15 = [v14 isComplete];

      if (v15) {
        [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
      }
    }
  }
}

- (void)_handleReadServiceInstanceId:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isHAPService:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v4 characteristics];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((sub_100053728(v10) & 1) == 0
            && [(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v10])
          {
            [(_HAPAccessoryServerBTLE200 *)self _discoverCharacteristic:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  int v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  uint64_t v12 = [v11 discoveringServices];
  [v12 removeObject:v4];

  unsigned int v13 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  LODWORD(v12) = [v13 isComplete];

  if (v12) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_discoverCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v6 = [v5 discoveringCharacteristics];
  [v6 addObject:v4];

  id v7 = self;
  uint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = sub_100083FD0(v7);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Discovering characteristic: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HAPAccessoryServerBTLE *)v7 peripheral];
  [v10 discoverDescriptorsForCharacteristic:v4];
}

- (void)_handleDiscoveredCharactersitic:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = sub_100083FD0(v8);
    int v11 = [v6 descriptors];
    int v16 = 138544130;
    long long v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Discovered descriptors: %@ for characteristic: %@ with error: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)v8 _cancelDiscoveryWithError:v7];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v8 _kickConnectionIdleTimer];
    if ([(_HAPAccessoryServerBTLE200 *)v8 isHAPCharacteristic:v6])
    {
      uint64_t v12 = [v6 descriptors];
      [(_HAPAccessoryServerBTLE200 *)v8 _handleDiscoveredDescriptors:v12];
    }
    __int16 v13 = [(_HAPAccessoryServerBTLE200 *)v8 discoveryContext];
    id v14 = [v13 discoveringCharacteristics];
    [v14 removeObject:v6];

    long long v15 = [(_HAPAccessoryServerBTLE200 *)v8 discoveryContext];
    LODWORD(v14) = [v15 isComplete];

    if (v14) {
      [(_HAPAccessoryServerBTLE200 *)v8 _readCharacteristicSignatures];
    }
  }
}

- (void)_handleDiscoveredDescriptors:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([(id)objc_opt_class() isHAPDescriptor:v9]) {
          [(_HAPAccessoryServerBTLE200 *)self _readDescriptorValue:v9];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_readCharacteristicValue:(id)a3
{
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v6 = [v5 readingCharacteristics];
  [v6 addObject:v4];

  uint64_t v7 = [v4 value];

  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)self _handleReadCharacteristicValue:v4 error:0];
  }
  else
  {
    uint64_t v8 = self;
    uint64_t v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      long long v10 = sub_100083FD0(v8);
      int v14 = 138543618;
      long long v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of characteristic: %@", (uint8_t *)&v14, 0x16u);
    }
    long long v11 = [(HAPAccessoryServerBTLE *)v8 peripheral];
    [v11 readValueForCharacteristic:v4];
  }
  long long v12 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  unsigned int v13 = [v12 isComplete];

  if (v13) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4
{
  id v12 = a3;
  if (a4)
  {
    [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:a4];
LABEL_7:
    long long v10 = v12;
    goto LABEL_8;
  }
  [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
  id v6 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  uint64_t v7 = [v6 readingCharacteristics];
  [v7 removeObject:v12];

  uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  LODWORD(v7) = [v8 isComplete];

  if (v7) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
  int v9 = sub_100053728(v12);
  long long v10 = v12;
  if (v9)
  {
    long long v11 = [v12 service];
    [(_HAPAccessoryServerBTLE200 *)self _handleReadServiceInstanceId:v11];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_readDescriptorValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];

  if (!v5)
  {
    id v6 = self;
    uint64_t v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = sub_100083FD0(v6);
      int v14 = 138543618;
      long long v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of descriptor: %@", (uint8_t *)&v14, 0x16u);
    }
    int v9 = [(_HAPAccessoryServerBTLE200 *)v6 discoveryContext];
    long long v10 = [v9 readingDescriptors];
    [v10 addObject:v4];

    long long v11 = [(HAPAccessoryServerBTLE *)v6 peripheral];
    [v11 readValueForDescriptor:v4];
  }
  id v12 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  unsigned int v13 = [v12 isComplete];

  if (v13) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  int v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = sub_100083FD0(v8);
    long long v11 = [v6 characteristic];
    id v12 = [v6 value];
    int v16 = 138544130;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Read value of descriptor: %@ for characteristic: %@ value: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)v8 _cancelDiscoveryWithError:v7];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v8 _kickConnectionIdleTimer];
    unsigned int v13 = [(_HAPAccessoryServerBTLE200 *)v8 discoveryContext];
    int v14 = [v13 readingDescriptors];
    [v14 removeObject:v6];

    long long v15 = [(_HAPAccessoryServerBTLE200 *)v8 discoveryContext];
    LODWORD(v14) = [v15 isComplete];

    if (v14) {
      [(_HAPAccessoryServerBTLE200 *)v8 _readCharacteristicSignatures];
    }
  }
}

- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v9 = [v8 readingCharacteristics];
  unsigned int v10 = [v9 containsObject:v6];

  if (!v10)
  {
    long long v11 = [v6 value];
    if ([v11 length])
    {
      id v12 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
      id v13 = [v12 count];

      if (v13)
      {
        long long v32 = v11;
        id v33 = v7;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        int v14 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
        id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v35;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              __int16 v20 = [v19 characteristic];
              id v21 = [v20 cbCharacteristic];
              unsigned int v22 = [v21 isEqual:v6];

              if (v22)
              {
                unsigned __int8 v30 = [v19 characteristic];
                long long v11 = v32;
                id v7 = v33;
                [(_HAPAccessoryServerBTLE200 *)self _handleResponseData:v32 fromCharacteristic:v30 error:v33];

                goto LABEL_25;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v23 = self;
        long long v24 = sub_100083F74();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          long long v25 = sub_100083FD0(v23);
          *(_DWORD *)buf = 138543618;
          id v40 = v25;
          __int16 v41 = 2112;
          id v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@Received unexpected response from characteristic: %@", buf, 0x16u);
        }
        long long v11 = v32;
        id v7 = v33;
        goto LABEL_26;
      }
      int v14 = [(_HAPAccessoryServerBTLE200 *)self _characteristicForCBCharacteristic:v6];
      [(_HAPAccessoryServerBTLE200 *)self _handleRawResponseData:v11 fromCharacteristic:v14 error:v7];
    }
    else
    {
      int v14 = [(_HAPAccessoryServerBTLE200 *)self _characteristicForCBCharacteristic:v6];
      long long v26 = self;
      __int16 v27 = sub_100083F74();
      id v28 = v27;
      if (v14)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v29 = sub_100083FD0(v26);
          *(_DWORD *)buf = 138543618;
          id v40 = v29;
          __int16 v41 = 2112;
          id v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}@Received zero-length value for characteristic: %@", buf, 0x16u);
        }
        [(_HAPAccessoryServerBTLE200 *)v26 _handleEventIndicationForCharacteristic:v14];
      }
      else
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v31 = sub_100083FD0(v26);
          *(_DWORD *)buf = 138543618;
          id v40 = v31;
          __int16 v41 = 2112;
          id v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@Received characteristic indication from unmapped characteristic: %@", buf, 0x16u);
        }
      }
    }
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  [(_HAPAccessoryServerBTLE200 *)self _handleReadCharacteristicValue:v6 error:v7];
LABEL_27:
}

- (void)_readCharacteristicSignatures
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = [(HAPAccessoryServerBTLE *)self peripheral];
  id v4 = [v3 services];

  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([(id)objc_opt_class() isHAPService:v9])
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          unsigned int v10 = [v9 characteristics];
          id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
                if (sub_1000548F4(v15)) {
                  [(_HAPAccessoryServerBTLE200 *)self _readServiceSignature:v15];
                }
                if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v15]) {
                  [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignature:v15];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  id v16 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  unsigned int v17 = [v16 isComplete];

  if (v17) {
    [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
  }
}

- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4
{
  [a3 descriptors];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v10 = [v9 UUID];
        id v11 = +[CBUUID UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
        unsigned __int8 v12 = [v10 isEqual:v11];

        if (v12)
        {
          uint64_t v13 = sub_100054B2C(v9, a4);

          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    +[NSError hapErrorWithcode:1 description:@"Characteristic missing the characteristic instance ID descriptor" reason:0 suggestion:0 underlyingError:0];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_12:

  return v13;
}

- (id)_getServiceInstanceID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 characteristics];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (sub_100053728(v9))
        {
          sub_100054DE0(v9, 0);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            unsigned int v10 = self;
            id v11 = sub_100083F74();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              unsigned __int8 v12 = sub_100083FD0(v10);
              *(_DWORD *)buf = 138543874;
              long long v19 = v12;
              __int16 v20 = 2112;
              id v21 = v4;
              __int16 v22 = 2112;
              long long v23 = v9;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get Service Instance ID for Service: %@, Characteristic: %@", buf, 0x20u);
            }
            id v6 = 0;
          }
          goto LABEL_14;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)_getProtocolInfoService
{
  [(_HAPAccessoryServerBTLE200 *)self _hapServicesFromCache];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 type:v12];
        unsigned __int8 v9 = [v8 isEqualToString:@"000000A2-0000-1000-8000-4D69736D6574"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_readCharacteristicSignature:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v4])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(__CFString *)v4 UUID];
    uint64_t v7 = [v5 hapUUIDFromBTLEUUID:v6];

    if (v7)
    {
      id v90 = 0;
      uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)self _getCharacteristicInstanceID:v4 error:&v90];
      unsigned __int8 v9 = (__CFString *)v90;
      if (v8)
      {
        if ([(_HAPAccessoryServerBTLE200 *)self isVerified])
        {
          unsigned int v10 = 0;
        }
        else
        {
          long long v24 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          if ([v24 discoveryType]) {
            unsigned int v10 = 0;
          }
          else {
            unsigned int v10 = [(_HAPAccessoryServerBTLE200 *)self shouldVerifyHAPCharacteristic:v4];
          }
        }
        uint64_t v25 = [(_HAPAccessoryServerBTLE200 *)self _characteristicForCBCharacteristic:v4];
        long long v26 = (void *)v25;
        if ((v10 & 1) == 0 && v25)
        {
          id v78 = v7;
          id v83 = v8;
          v85 = v9;
          __int16 v27 = self;
          id v28 = sub_100083F74();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            id v29 = sub_100083FD0(v27);
            *(_DWORD *)buf = 138543618;
            long long v92 = v29;
            __int16 v93 = 2112;
            CFStringRef v94 = v4;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}@Found cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);
          }
          id v77 = [HAPBTLECharacteristicSignature alloc];
          v81 = v27;
          id v30 = objc_alloc((Class)NSUUID);
          uint64_t v79 = [v26 type];
          id v31 = [v30 initWithUUIDString:v79];
          long long v32 = [v26 service];
          id v33 = [v32 instanceID];
          id v34 = objc_alloc((Class)NSUUID);
          long long v35 = [v26 service];
          long long v36 = [v35 type];
          id v37 = [v34 initWithUUIDString:v36];
          id v38 = [v26 properties];
          __int16 v39 = [v26 metadata];
          id v40 = [(HAPBTLECharacteristicSignature *)v77 initWithCharacteristicType:v31 serviceInstanceID:v33 serviceType:v37 characteristicProperties:v38 characteristicMetadata:v39 authenticated:0];

          __int16 v41 = v40;
          id v42 = [(_HAPAccessoryServerBTLE200 *)v81 discoveryContext];
          __int16 v43 = [v42 characteristicSignatures];
          [v43 setObject:v41 forKey:v4];

          uint64_t v8 = v83;
          unsigned __int8 v9 = v85;
          uint64_t v7 = v78;
          goto LABEL_46;
        }
        if (v10 && [0 isAuthenticated])
        {
          id v44 = self;
          __int16 v45 = sub_100083F74();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            id v46 = sub_100083FD0(v44);
            *(_DWORD *)buf = 138543618;
            long long v92 = v46;
            __int16 v93 = 2112;
            CFStringRef v94 = v4;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%{public}@Found authenitcated cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);
          }
          __int16 v41 = [(_HAPAccessoryServerBTLE200 *)v44 discoveryContext];
          id v42 = [v41 characteristicSignatures];
          [v42 setObject:0 forKey:v4];
          goto LABEL_46;
        }
        __int16 v47 = self;
        int v48 = sub_100083F74();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          long long v49 = sub_100083FD0(v47);
          *(_DWORD *)buf = 138543618;
          long long v92 = v49;
          __int16 v93 = 2112;
          CFStringRef v94 = v4;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for characteristic: %@", buf, 0x16u);
        }
        long long v50 = +[HAPMetadata getSharedInstance];
        uint64_t v51 = [v7 UUIDString];
        id v42 = [v50 getDefaultCharacteristicProperties:v51];

        v86 = v9;
        v76 = v26;
        id v82 = v50;
        if (v42) {
          uint64_t v52 = (uint64_t)[v42 unsignedLongLongValue];
        }
        else {
          uint64_t v52 = 2;
        }
        id v53 = [HAPCharacteristic alloc];
        id v54 = [v7 UUIDString];
        uint64_t v55 = [(HAPAccessoryServerBTLE *)v47 stateNumber];
        LOBYTE(v75) = 1;
        id v56 = [(HAPCharacteristic *)v53 initWithType:v54 instanceID:v8 value:0 stateNumber:v55 properties:v52 eventNotificationsEnabled:0 implicitWriteWithResponse:v75 metadata:0];

        unsigned __int8 v84 = v8;
        if (v56)
        {
          [(HAPCharacteristic *)v56 setCBCharacteristic:v4];
          v57 = [(_HAPAccessoryServerBTLE200 *)v47 discoveryContext];
          BOOL v58 = [v57 discoveryType] == 0;

          id v89 = 0;
          uint64_t v59 = [(id)objc_opt_class() signatureRequestForCharacteristic:v56 requiresAuthentication:v58 error:&v89];
          v80 = (__CFString *)v89;
          if (v59)
          {
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = sub_100055A58;
            v87[3] = &unk_1002739C0;
            v87[4] = v47;
            uint64_t v60 = v4;
            id v88 = v60;
            v61 = objc_retainBlock(v87);
            [(_HAPAccessoryServerBTLE200 *)v47 _sendRequest:v59 shouldPrioritize:0 responseHandler:v61];
            id v62 = [(_HAPAccessoryServerBTLE200 *)v47 discoveryContext];
            id v63 = [v62 readingSignatureCharacteristics];
            [v63 addObject:v60];

            long long v26 = v76;
            long long v64 = v80;
LABEL_45:

            uint64_t v8 = v84;
            unsigned __int8 v9 = v86;
            __int16 v41 = v82;
LABEL_46:

            goto LABEL_47;
          }
          v72 = v47;
          char v73 = sub_100083F74();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            v74 = sub_100083FD0(v72);
            *(_DWORD *)buf = 138543874;
            long long v92 = v74;
            __int16 v93 = 2112;
            CFStringRef v94 = v4;
            __int16 v95 = 2112;
            BOOL v96 = v80;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for characteristic, %@, with error: %@", buf, 0x20u);
          }
          long long v69 = v72;
          long long v70 = v4;
          long long v64 = v80;
          long long v71 = v80;
        }
        else
        {
          long long v65 = [v7 UUIDString];
          long long v64 = +[NSString stringWithFormat:@"Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu", v65, v8, v52];

          long long v66 = v47;
          long long v67 = sub_100083F74();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            long long v68 = sub_100083FD0(v66);
            *(_DWORD *)buf = 138543618;
            long long v92 = v68;
            __int16 v93 = 2112;
            CFStringRef v94 = v64;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
          }
          uint64_t v59 = +[NSError hapErrorWithcode:3 description:v64 reason:0 suggestion:0 underlyingError:0];
          long long v69 = v66;
          long long v70 = v4;
          long long v71 = v59;
        }
        [(_HAPAccessoryServerBTLE200 *)v69 _handleReadCharacteristicSignature:v70 error:v71];
        long long v26 = v76;
        goto LABEL_45;
      }
      id v21 = self;
      __int16 v22 = sub_100083F74();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = sub_100083FD0(v21);
        *(_DWORD *)buf = 138543874;
        long long v92 = v23;
        __int16 v93 = 2112;
        CFStringRef v94 = v4;
        __int16 v95 = 2112;
        BOOL v96 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get characteristic, %@, instance ID with error: %@", buf, 0x20u);
      }
      long long v18 = v21;
      long long v19 = v4;
      __int16 v20 = v9;
    }
    else
    {
      long long v14 = [(__CFString *)v4 UUID];
      unsigned __int8 v9 = +[NSString stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v14];

      long long v15 = self;
      long long v16 = sub_100083F74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        long long v17 = sub_100083FD0(v15);
        *(_DWORD *)buf = 138543618;
        long long v92 = v17;
        __int16 v93 = 2112;
        CFStringRef v94 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      uint64_t v8 = +[NSError hapErrorWithcode:3 description:v9 reason:0 suggestion:0 underlyingError:0];
      long long v18 = v15;
      long long v19 = v4;
      __int16 v20 = v8;
    }
    [(_HAPAccessoryServerBTLE200 *)v18 _handleReadCharacteristicSignature:v19 error:v20];
LABEL_47:

    goto LABEL_48;
  }
  id v11 = self;
  long long v12 = sub_100083F74();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v13 = sub_100083FD0(v11);
    *(_DWORD *)buf = 138543618;
    long long v92 = v13;
    __int16 v93 = 2112;
    CFStringRef v94 = @"Characteristic does not support HAP";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
  }
  uint64_t v7 = +[NSError hapErrorWithcode:3 description:@"Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
  [(_HAPAccessoryServerBTLE200 *)v11 _handleReadCharacteristicSignature:v4 error:v7];
LABEL_48:
}

- (void)_readServiceSignature:(id)a3
{
  id v4 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v4])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [v4 service];
    uint64_t v7 = [v6 UUID];
    uint64_t v8 = [v5 hapUUIDFromBTLEUUID:v7];

    if (v8)
    {
      unsigned __int8 v9 = [v4 service];
      uint64_t v10 = [(_HAPAccessoryServerBTLE200 *)self _getServiceInstanceID:v9];

      id v105 = 0;
      uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self _getCharacteristicInstanceID:v4 error:&v105];
      long long v12 = (__CFString *)v105;
      if (v10 | v11)
      {
        if ([(_HAPAccessoryServerBTLE200 *)self isVerified])
        {
          unsigned int v13 = 0;
        }
        else
        {
          __int16 v27 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          if ([v27 discoveryType])
          {
            unsigned int v13 = 0;
          }
          else
          {
            id v28 = [v4 service];
            unsigned int v13 = [(_HAPAccessoryServerBTLE200 *)self shouldVerifyHAPService:v28];
          }
        }
        id v29 = [v4 service];
        long long v26 = [(_HAPAccessoryServerBTLE200 *)self _serviceForCBService:v29];

        v98 = (void *)v10;
        if ((v13 & 1) != 0 || !v26)
        {
          if (v13 && [0 isAuthenticated])
          {
            __int16 v45 = self;
            id v46 = sub_100083F74();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              sub_100083FD0(v45);
              __int16 v47 = v26;
              long long v49 = v48 = v11;
              long long v50 = [v4 service];
              *(_DWORD *)buf = 138543618;
              v107 = v49;
              __int16 v108 = 2112;
              CFStringRef v109 = v50;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading service signature for service: %@", buf, 0x16u);

              uint64_t v11 = v48;
              long long v26 = v47;
            }

            __int16 v41 = [(_HAPAccessoryServerBTLE200 *)v45 discoveryContext];
            id v42 = [(HAPBTLEServiceSignature *)v41 serviceSignatures];
            __int16 v43 = [v4 service];
            [v42 setObject:0 forKey:v43];
          }
          else
          {
            uint64_t v97 = v11;
            uint64_t v51 = self;
            uint64_t v52 = sub_100083F74();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              id v53 = sub_100083FD0(v51);
              id v54 = [v4 service];
              *(_DWORD *)buf = 138543618;
              v107 = v53;
              __int16 v108 = 2112;
              CFStringRef v109 = v54;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for service: %@", buf, 0x16u);
            }
            uint64_t v55 = +[HAPMetadata getSharedInstance];
            id v56 = [v8 UUIDString];
            id v42 = [(HAPBTLEServiceSignature *)v55 getDefaultServiceProperties:v56];

            CFStringRef v93 = v26;
            __int16 v95 = v55;
            if (v42) {
              id v57 = [v42 unsignedLongLongValue];
            }
            else {
              id v57 = 0;
            }
            BOOL v58 = [HAPService alloc];
            uint64_t v59 = [v8 UUIDString];
            uint64_t v60 = [(HAPService *)v58 initWithType:v59 instanceID:v98 parsedCharacteristics:0 serviceProperties:v57 linkedServices:0];

            long long v92 = v60;
            if (v60)
            {
              id v90 = v42;
              v61 = [v4 service];
              [(HAPService *)v60 setCBService:v61];

              id v62 = [HAPCharacteristic alloc];
              id v63 = [v4 UUID];
              long long v64 = [v63 UUIDString];
              long long v65 = [(HAPAccessoryServerBTLE *)v51 stateNumber];
              LOBYTE(v88) = 1;
              long long v66 = [(HAPCharacteristic *)v62 initWithType:v64 instanceID:v97 value:0 stateNumber:v65 properties:2 eventNotificationsEnabled:0 implicitWriteWithResponse:v88 metadata:0];

              [(HAPCharacteristic *)v66 setCBCharacteristic:v4];
              [(HAPCharacteristic *)v66 setService:v60];
              long long v67 = [(_HAPAccessoryServerBTLE200 *)v51 discoveryContext];
              BOOL v68 = [v67 discoveryType] == 0;

              id v104 = 0;
              id v91 = v66;
              uint64_t v69 = [(id)objc_opt_class() signatureRequestForService:v60 characteristic:v66 requiresAuthentication:v68 error:&v104];
              id v70 = v104;
              id v89 = v70;
              if (v69)
              {
                [v4 service];
                v99[0] = _NSConcreteStackBlock;
                v99[1] = 3221225472;
                v99[2] = sub_10005688C;
                v99[3] = &unk_1002739E8;
                id v100 = (id)objc_claimAutoreleasedReturnValue();
                v101 = v51;
                id v102 = v98;
                id v103 = v8;
                id v71 = v100;
                v72 = objc_retainBlock(v99);
                [(_HAPAccessoryServerBTLE200 *)v51 _sendRequest:v69 shouldPrioritize:0 responseHandler:v72];
                char v73 = [(_HAPAccessoryServerBTLE200 *)v51 discoveryContext];
                [v73 readingSignatureServices];
                uint64_t v75 = v74 = (void *)v69;
                v76 = [v4 service];
                [v75 addObject:v76];

                long long v26 = (__CFString *)v93;
                __int16 v41 = v95;
                id v42 = v90;
              }
              else
              {
                id v84 = v70;
                v85 = v51;
                v86 = sub_100083F74();
                long long v26 = (__CFString *)v93;
                if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v87 = sub_100083FD0(v85);
                  *(_DWORD *)buf = 138543874;
                  v107 = v87;
                  __int16 v108 = 2112;
                  CFStringRef v109 = v93;
                  __int16 v110 = 2112;
                  id v111 = v84;
                  _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for service, %@, with error: %@", buf, 0x20u);
                }
                id v71 = [v4 service];
                [(_HAPAccessoryServerBTLE200 *)v85 _handleReadServiceSignature:v71 error:v84];
                __int16 v41 = v95;
                id v42 = v90;
                v74 = 0;
              }

              uint64_t v11 = v97;
              uint64_t v10 = (uint64_t)v98;
              id v83 = v91;
              id v82 = v89;
            }
            else
            {
              id v77 = [v8 UUIDString];
              uint64_t v78 = +[NSString stringWithFormat:@"Failed to create service with type, %@, instance ID, %@, properties, %tu", v77, v98, v57];

              uint64_t v79 = v51;
              v80 = sub_100083F74();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                v81 = sub_100083FD0(v79);
                *(_DWORD *)buf = 138543618;
                v107 = v81;
                __int16 v108 = 2112;
                CFStringRef v109 = (const __CFString *)v78;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
              }
              id v82 = +[NSError hapErrorWithcode:3 description:v78 reason:0 suggestion:0 underlyingError:0];
              [(_HAPAccessoryServerBTLE200 *)v79 _handleReadCharacteristicSignature:v4 error:v82];
              uint64_t v11 = v97;
              uint64_t v10 = (uint64_t)v98;
              id v83 = (void *)v78;
              long long v26 = (__CFString *)v93;
              __int16 v41 = v95;
            }

            __int16 v43 = v92;
          }
        }
        else
        {
          CFStringRef v94 = v8;
          uint64_t v96 = v11;
          id v30 = self;
          id v31 = sub_100083F74();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            long long v32 = sub_100083FD0(v30);
            id v33 = [v4 service];
            *(_DWORD *)buf = 138543618;
            v107 = v32;
            __int16 v108 = 2112;
            CFStringRef v109 = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}@Found cached service signature, skipping reading service signature for service: %@", buf, 0x16u);
          }
          id v34 = [HAPBTLEServiceSignature alloc];
          id v35 = objc_alloc((Class)NSUUID);
          long long v36 = [(__CFString *)v26 type];
          id v37 = [v35 initWithUUIDString:v36];
          id v38 = [(__CFString *)v26 instanceID];
          id v39 = [(__CFString *)v26 serviceProperties];
          id v40 = [(__CFString *)v26 linkedServices];
          __int16 v41 = [(HAPBTLEServiceSignature *)v34 initWithServiceType:v37 serviceInstanceID:v38 serviceProperties:v39 linkedServices:v40 authenticated:0];

          id v42 = [(_HAPAccessoryServerBTLE200 *)v30 discoveryContext];
          __int16 v43 = [v42 serviceSignatures];
          id v44 = [v4 service];
          [v43 setObject:v41 forKey:v44];

          uint64_t v11 = v96;
          uint64_t v10 = (uint64_t)v98;
          uint64_t v8 = v94;
        }
      }
      else
      {
        __int16 v22 = self;
        long long v23 = sub_100083F74();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          long long v24 = sub_100083FD0(v22);
          uint64_t v25 = [v4 service];
          *(_DWORD *)buf = 138544130;
          v107 = v24;
          __int16 v108 = 2112;
          CFStringRef v109 = v25;
          __int16 v110 = 2112;
          id v111 = v4;
          __int16 v112 = 2112;
          v113 = v12;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get service/characteristic, %@/%@, instance ID with error: %@", buf, 0x2Au);
        }
        long long v26 = [v4 service];
        [(_HAPAccessoryServerBTLE200 *)v22 _handleReadServiceSignature:v26 error:v12];
      }
    }
    else
    {
      long long v17 = [v4 service];
      long long v18 = [v17 UUID];
      long long v12 = +[NSString stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v18];

      long long v19 = self;
      __int16 v20 = sub_100083F74();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = sub_100083FD0(v19);
        *(_DWORD *)buf = 138543618;
        v107 = v21;
        __int16 v108 = 2112;
        CFStringRef v109 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      uint64_t v10 = +[NSError hapErrorWithcode:3 description:v12 reason:0 suggestion:0 underlyingError:0];
      uint64_t v11 = [v4 service];
      [(_HAPAccessoryServerBTLE200 *)v19 _handleReadServiceSignature:v11 error:v10];
    }
  }
  else
  {
    long long v14 = self;
    long long v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = sub_100083FD0(v14);
      *(_DWORD *)buf = 138543618;
      v107 = v16;
      __int16 v108 = 2112;
      CFStringRef v109 = @"Service Properties Characteristic does not support HAP";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    uint64_t v8 = +[NSError hapErrorWithcode:3 description:@"Service Properties Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
    long long v12 = [v4 service];
    [(_HAPAccessoryServerBTLE200 *)v14 _handleReadServiceSignature:v12 error:v8];
  }
}

+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[HAPBTLERequest alloc] initWithCharacteristic:v6 requestType:1 bodyData:0 shouldEncrypt:v5 timeoutInterval:10.0];

  return v7;
}

+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 = a4;
  uint64_t v8 = [[HAPBTLERequest alloc] initWithCharacteristic:v7 requestType:6 bodyData:0 shouldEncrypt:v6 timeoutInterval:10.0];

  return v8;
}

+ (id)parseSignatureResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 body];
  [v6 bytes];

  id v7 = [v5 body];
  [v7 length];

  uint64_t v8 = [v5 request];
  unsigned int v9 = [v8 type];

  if (v9 == 1) {
    TLV8GetOrCopyCoalesced();
  }
  uint64_t v10 = +[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:");
  uint64_t v11 = +[NSError hapErrorWithcode:12 description:@"Signature request failed." reason:@"Failed to parse signature response body." suggestion:0 underlyingError:v10];

  if (v11)
  {
    long long v12 = 0;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    long long v12 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:]([HAPBTLECharacteristicSignature alloc], "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", 0, 0, 0, 0, 0, [v5 isEncrypted]);
  }

  return v12;
}

+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 body];
  [v12 bytes];

  unsigned int v13 = [v9 body];
  [v13 length];

  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v28 = 0;
  id v29 = 0;
  long long v14 = +[NSMutableArray array];
  long long v15 = [v9 request];
  unsigned int v16 = [v15 type];

  if (v16 == 6)
  {
    id v17 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      long long v18 = +[NSData dataWithBytes:v31 length:v30];
      if (!v18)
      {
        id v17 = 0;
LABEL_17:
        uint64_t v21 = 4294960559;
LABEL_20:

        goto LABEL_21;
      }
      id v27 = 0;
      BOOL v19 = sub_100058C44(v18, &v28, &v27);
      id v17 = v27;
      if (!v19)
      {
        uint64_t v21 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v20 = TLV8GetOrCopyCoalesced();
    if (v20 == -6727) {
      goto LABEL_25;
    }
    uint64_t v21 = v20;
    if (!v20)
    {
      long long v18 = +[NSData dataWithBytes:v31 length:v30];
      if (v29)
      {
        free(v29);
        id v29 = 0;
      }
      if (v18)
      {
        if (![v18 length])
        {
          id v22 = v17;
          goto LABEL_24;
        }
        id v26 = v17;
        uint64_t v21 = sub_100058CFC(v18, v14, &v26);
        id v22 = v26;

        if (v21)
        {
          [v14 removeObject:v10];
LABEL_24:

          id v17 = v22;
          goto LABEL_25;
        }
        id v17 = v22;
        goto LABEL_20;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v17 = 0;
    uint64_t v21 = 4294960591;
  }
LABEL_21:
  if (!v17 && v21)
  {
    long long v18 = +[NSError errorWithOSStatus:v21];
    id v22 = +[NSError hapErrorWithcode:12 description:@"Service Signature response failed." reason:@"Failed to parse service signature response body." suggestion:0 underlyingError:v18];
    goto LABEL_24;
  }
LABEL_25:
  if (v17)
  {
    long long v23 = 0;
    if (a6) {
      *a6 = v17;
    }
  }
  else
  {
    long long v24 = [HAPBTLEServiceSignature alloc];
    long long v23 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:](v24, "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v11, v10, v28, v14, [v9 isEncrypted]);
  }

  return v23;
}

- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (![(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v7])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100058F78;
      v12[3] = &unk_100273418;
      v12[4] = self;
      id v13 = v6;
      id v8 = v7;
      id v14 = v8;
      sub_100058F78((id *)v12);
      [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:v8];
    }
  }
  else
  {
    id v9 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    id v10 = [v9 readingSignatureCharacteristics];
    [v10 removeObject:v6];

    id v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    LODWORD(v10) = [v11 isComplete];

    if (v10) {
      [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
    }
  }
}

- (void)_handleReadServiceSignature:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (![(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v7])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100059208;
      v12[3] = &unk_100273418;
      v12[4] = self;
      id v13 = v6;
      id v8 = v7;
      id v14 = v8;
      sub_100059208((id *)v12);
      [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:v8];
    }
  }
  else
  {
    id v9 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    id v10 = [v9 readingSignatureServices];
    [v10 removeObject:v6];

    id v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    LODWORD(v10) = [v11 isComplete];

    if (v10) {
      [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
    }
  }
}

+ (BOOL)isHAPService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 UUID];
  id v5 = +[CBUUID UUIDWithString:CBUUIDGenericAccessProfileString];
  if ([v4 isEqual:v5]) {
    goto LABEL_10;
  }
  id v6 = [v3 UUID];
  id v7 = +[CBUUID UUIDWithString:CBUUIDGenericAttributeProfileString];
  if ([v6 isEqual:v7])
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  id v8 = [v3 UUID];
  id v9 = +[CBUUID UUIDWithString:CBUUIDContinuityServiceString];
  if ([v8 isEqual:v9])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v10 = [v3 UUID];
  id v11 = +[CBUUID UUIDWithString:CBUUIDAppleNotificationCenterServiceString];
  if ([v10 isEqual:v11])
  {

    goto LABEL_8;
  }
  id v33 = v11;
  id v34 = v10;
  id v12 = [v3 UUID];
  id v13 = +[CBUUID UUIDWithString:CBUUIDAppleMediaServiceString];
  if ([v12 isEqual:v13])
  {

    goto LABEL_8;
  }
  long long v32 = v13;
  unsigned int v16 = [v3 UUID];
  uint64_t v30 = +[CBUUID UUIDWithString:CBUUIDAppleAccessoryReconnectServiceString];
  uint64_t v31 = v16;
  if (objc_msgSend(v16, "isEqual:"))
  {
    unsigned __int8 v17 = 1;
    long long v18 = v32;
  }
  else
  {
    BOOL v19 = [v3 UUID];
    uint64_t v28 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
    id v29 = v19;
    if (objc_msgSend(v19, "isEqual:"))
    {
      unsigned __int8 v17 = 1;
    }
    else
    {
      id v27 = [v3 UUID];
      uint64_t v20 = +[CBUUID UUIDWithString:CBUUIDBatteryServiceString];
      unsigned __int8 v17 = [v27 isEqual:];
    }
    long long v18 = v32;
  }
  if (v17) {
    goto LABEL_12;
  }
  uint64_t v21 = [v3 characteristics];
  id v22 = [v21 count];

  if (!v22)
  {
LABEL_32:
    BOOL v14 = 1;
    goto LABEL_13;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = [v3 characteristics];
  id v23 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v4);
        }
        if (sub_100053728(*(void **)(*((void *)&v35 + 1) + 8 * i)))
        {

          goto LABEL_32;
        }
      }
      id v24 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_11:

LABEL_12:
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)isHAPCharacteristic:(id)a3
{
  id v3 = a3;
  if (sub_100053728(v3))
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 descriptors];
    if ([v5 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        long long v15 = v5;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) UUID];
            id v12 = +[CBUUID UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
            unsigned __int8 v13 = [v11 isEqual:v12];

            if (v13)
            {
              BOOL v4 = 1;
              goto LABEL_14;
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
        BOOL v4 = 0;
LABEL_14:
        id v5 = v15;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)shouldVerifyHAPCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 service];
  id v6 = [v5 UUID];
  id v7 = +[CBUUID UUIDWithString:@"FED4"];
  if ([v6 isEqual:v7])
  {
  }
  else
  {
    id v8 = [v4 service];
    uint64_t v9 = [v8 UUID];
    id v10 = +[CBUUID UUIDWithString:@"00000010-0000-1000-8000-4D69736D6574"];
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_10;
    }
  }
  id v12 = [v4 UUID];
  unsigned __int8 v13 = +[CBUUID UUIDWithString:@"00000011-0000-1000-8000-4D69736D6574"];
  if (![v12 isEqual:v13])
  {
    BOOL v14 = [v4 UUID];
    uint64_t v9 = +[CBUUID UUIDWithString:@"00000012-0000-1000-8000-4D69736D6574"];
    if ([v14 isEqual:v9])
    {

      goto LABEL_7;
    }
    long long v16 = [v4 UUID];
    long long v17 = +[CBUUID UUIDWithString:@"00000013-0000-1000-8000-4D69736D6574"];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_8;
    }
LABEL_10:
    long long v19 = [v4 service];
    uint64_t v20 = [v19 UUID];
    uint64_t v21 = +[CBUUID UUIDWithString:@"FED3"];
    unsigned __int8 v22 = [v20 isEqual:v21];
    if ((v22 & 1) == 0)
    {
      id v23 = [v4 service];
      id v24 = [v23 UUID];
      uint64_t v9 = +[CBUUID UUIDWithString:@"0000003E-0000-1000-8000-4D69736D6574"];
      if (![v24 isEqual:v9])
      {
        LOBYTE(v28) = 0;
LABEL_19:

LABEL_20:
        char v15 = v28 ^ 1;
        goto LABEL_21;
      }
      uint64_t v30 = v24;
      long long v32 = v23;
    }
    uint64_t v25 = self;
    id v26 = [v4 UUID:v30];
    id v27 = +[CBUUID UUIDWithString:@"00000014-0000-1000-8000-4D69736D6574"];
    if ([v26 isEqual:v27]) {
      unsigned int v28 = ![(HAPAccessoryServerBTLE *)v25 isPaired];
    }
    else {
      LOBYTE(v28) = 0;
    }
    id v24 = v31;

    id v23 = v32;
    if (v22) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_7:

LABEL_8:
  char v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)shouldVerifyHAPService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  id v6 = +[CBUUID UUIDWithString:@"FED4"];
  if ([v5 isEqual:v6])
  {

LABEL_4:
    char v10 = 0;
    goto LABEL_12;
  }
  id v7 = [v4 UUID];
  id v8 = +[CBUUID UUIDWithString:@"00000010-0000-1000-8000-4D69736D6574"];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if (v9) {
    goto LABEL_4;
  }
  unsigned int v11 = [v4 UUID];
  id v12 = +[CBUUID UUIDWithString:@"FED3"];
  if ([v11 isEqual:v12])
  {
    unsigned int v13 = ![(HAPAccessoryServerBTLE *)self isPaired];
  }
  else
  {
    BOOL v14 = [v4 UUID];
    char v15 = +[CBUUID UUIDWithString:@"0000003E-0000-1000-8000-4D69736D6574"];
    if ([v14 isEqual:v15]) {
      unsigned int v13 = ![(HAPAccessoryServerBTLE *)self isPaired];
    }
    else {
      LOBYTE(v13) = 0;
    }
  }
  char v10 = v13 ^ 1;
LABEL_12:

  return v10;
}

+ (BOOL)isHAPDescriptor:(id)a3
{
  id v3 = [a3 UUID];
  id v4 = +[CBUUID UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_parseService:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v92 = a4;
  if (([(id)objc_opt_class() isHAPService:v6] & 1) == 0)
  {
    id v23 = self;
    id v24 = sub_100083F74();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = sub_100083FD0(v23);
      *(_DWORD *)buf = 138543618;
      v106 = v25;
      __int16 v107 = 2112;
      CFStringRef v108 = @"Service does not support HAP";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      a4 = v92;
    }

    if (a4)
    {
      +[NSError hapErrorWithcode:3 description:@"Service does not support HAP" reason:0 suggestion:0 underlyingError:0];
      id v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = 0;
    }
    goto LABEL_78;
  }
  id v7 = [v6 UUID];
  id v8 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v7];

  if (!v8)
  {
    id v27 = [v6 UUID];
    unsigned int v13 = +[NSString stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v27];

    unsigned int v28 = self;
    id v29 = sub_100083F74();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = sub_100083FD0(v28);
      *(_DWORD *)buf = 138543618;
      v106 = v30;
      __int16 v107 = 2112;
      CFStringRef v108 = v13;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      a4 = v92;
    }

    if (a4)
    {
      +[NSError hapErrorWithcode:3 description:v13 reason:0 suggestion:0 underlyingError:0];
      id v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = 0;
    }
    goto LABEL_77;
  }
  id v89 = v8;
  unsigned __int8 v9 = [v6 characteristics];
  CFStringRef v94 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v86 = v6;
  char v10 = [v6 characteristics];
  id v11 = [v10 countByEnumeratingWithState:&v100 objects:v111 count:16];
  CFStringRef v93 = self;
  if (!v11)
  {
    unsigned int v13 = 0;
    goto LABEL_33;
  }
  id v12 = v11;
  unsigned int v13 = 0;
  uint64_t v14 = *(void *)v101;
  id v90 = v10;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      long long v16 = v13;
      if (*(void *)v101 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v17 = *(__CFString **)(*((void *)&v100 + 1) + 8 * i);
      if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v17])
      {
        id v99 = 0;
        unsigned __int8 v18 = [(_HAPAccessoryServerBTLE200 *)self _parseCharacteristic:v17 error:&v99];
        id v19 = v99;
        if (v18)
        {
          [v94 addObject:v18];
        }
        else
        {
          uint64_t v20 = self;
          uint64_t v21 = sub_100083F74();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v22 = sub_100083FD0(v20);
            *(_DWORD *)buf = 138543874;
            v106 = v22;
            __int16 v107 = 2112;
            CFStringRef v108 = v17;
            __int16 v109 = 2112;
            id v110 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse characteristic, %@, with error: %@", buf, 0x20u);

            a4 = v92;
          }

          char v10 = v90;
          self = v93;
        }

LABEL_19:
        unsigned int v13 = v16;
        continue;
      }
      if (!sub_100053728(v17)) {
        goto LABEL_19;
      }
      if (v16)
      {
        uint64_t v59 = self;
        uint64_t v60 = sub_100083F74();
        id v8 = v89;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v61 = sub_100083FD0(v59);
          *(_DWORD *)buf = 138543618;
          v106 = v61;
          __int16 v107 = 2112;
          CFStringRef v108 = @"Invalid service, multiple Service Instance ID characteristics.";
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

          a4 = v92;
        }

        if (a4)
        {
          +[NSError hapErrorWithcode:9 description:@"Invalid service, multiple Service Instance ID characteristics." reason:0 suggestion:0 underlyingError:0];
          id v26 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v26 = 0;
        }
        unsigned int v13 = v16;
        id v6 = v86;
        goto LABEL_76;
      }
      sub_100054DE0(v17, a4);
      unsigned int v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        id v62 = self;
        id v63 = sub_100083F74();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          long long v65 = sub_100083FD0(v62);
          *(_DWORD *)buf = 138543362;
          v106 = v65;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Service Instance ID", buf, 0xCu);
        }
        id v26 = 0;
        unsigned int v13 = 0;
        id v6 = v86;
        goto LABEL_75;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v100 objects:v111 count:16];
  }
  while (v12);
LABEL_33:

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v31 = v94;
  id v32 = [v31 countByEnumeratingWithState:&v95 objects:v104 count:16];
  id v8 = v89;
  if (!v32) {
    goto LABEL_45;
  }
  id v33 = v32;
  uint64_t v87 = *(void *)v96;
  while (2)
  {
    id v34 = 0;
    while (2)
    {
      if (*(void *)v96 != v87) {
        objc_enumerationMutation(v31);
      }
      long long v35 = v31;
      long long v36 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v34);
      long long v37 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      long long v38 = [v37 characteristicSignatures];
      id v39 = [v36 cbCharacteristic];
      id v40 = [v38 objectForKey:v39];

      if (!v40)
      {
        long long v66 = +[NSString stringWithFormat:@"Missing characteristic signature for characteristic: %@", v36];
        long long v67 = v93;
        BOOL v68 = sub_100083F74();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = sub_100083FD0(v67);
          *(_DWORD *)buf = 138543618;
          v106 = v69;
          __int16 v107 = 2112;
          CFStringRef v108 = v66;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
        id v6 = v86;
        char v10 = v35;
        if (v92)
        {
          *long long v92 = +[NSError hapErrorWithcode:9 description:v66 reason:0 suggestion:0 underlyingError:0];
        }

        id v26 = 0;
LABEL_75:
        id v8 = v89;
        goto LABEL_76;
      }
      __int16 v41 = [v40 serviceType];
      id v42 = [v41 UUIDString];
      __int16 v43 = +[CBUUID UUIDWithString:v42];

      id v44 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v43];
      __int16 v45 = [v40 serviceType];
      if ([v45 isEqual:v89])
      {

        goto LABEL_42;
      }
      unsigned __int8 v46 = [v44 isEqual:v89];

      if ((v46 & 1) == 0)
      {
        uint64_t v79 = [v40 serviceType];
        v80 = [v79 UUIDString];
        v81 = [v89 UUIDString];
        id v82 = [v43 UUIDString];
        uint64_t v83 = +[NSString stringWithFormat:@"The authenticated service type, %@, does not match the service type, %@ or %@, for characteristic: %@", v80, v81, v82, v36];

        id v71 = (__CFString *)v83;
        v72 = v93;
        char v73 = sub_100083F74();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
LABEL_71:
          id v84 = sub_100083FD0(v72);
          *(_DWORD *)buf = 138543618;
          v106 = v84;
          __int16 v107 = 2112;
          CFStringRef v108 = v71;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
LABEL_72:

        id v6 = v86;
        if (v92)
        {
          *long long v92 = +[NSError hapErrorWithcode:9 description:v71 reason:0 suggestion:0 underlyingError:0];
        }

        id v26 = 0;
        char v10 = v35;
        goto LABEL_75;
      }
LABEL_42:
      __int16 v47 = [v40 serviceInstanceID];
      unsigned __int8 v48 = [v47 isEqualToNumber:v13];

      if ((v48 & 1) == 0)
      {
        id v70 = [v40 serviceInstanceID];
        id v71 = +[NSString stringWithFormat:@"The authenticated service instance ID, %@, does not match the service instance ID, %@, for characteristic: %@", v70, v13, v36];

        v72 = v93;
        char v73 = sub_100083F74();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        goto LABEL_72;
      }

      id v34 = (char *)v34 + 1;
      id v31 = v35;
      self = v93;
      if (v33 != v34) {
        continue;
      }
      break;
    }
    id v33 = [v35 countByEnumeratingWithState:&v95 objects:v104 count:16];
    id v8 = v89;
    if (v33) {
      continue;
    }
    break;
  }
LABEL_45:
  id v91 = v31;

  long long v49 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  long long v50 = [v49 serviceSignatures];
  id v6 = v86;
  uint64_t v51 = [v50 objectForKey:v86];

  uint64_t v52 = [HAPService alloc];
  id v53 = [v8 UUIDString];
  id v54 = [v31 copy];
  id v55 = [v51 serviceProperties];
  uint64_t v88 = v51;
  id v56 = [v51 linkedServices];
  id v57 = [v56 copy];
  id v26 = [(HAPService *)v52 initWithType:v53 instanceID:v13 parsedCharacteristics:v54 serviceProperties:v55 linkedServices:v57];

  if (v26)
  {
    [(HAPService *)v26 setCBService:v86];
    BOOL v58 = v26;
  }
  else
  {
    v74 = [v8 UUIDString];
    uint64_t v75 = +[NSString stringWithFormat:@"Failed to create service with type, %@, service instance ID, %@, characteristics, %@", v74, v13, v91];

    v76 = v93;
    id v77 = sub_100083F74();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      uint64_t v78 = sub_100083FD0(v76);
      *(_DWORD *)buf = 138543618;
      v106 = v78;
      __int16 v107 = 2112;
      CFStringRef v108 = v75;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    if (v92)
    {
      *long long v92 = +[NSError hapErrorWithcode:3 description:v75 reason:0 suggestion:0 underlyingError:0];
    }

    id v6 = v86;
  }

  char v10 = v88;
LABEL_76:

LABEL_77:
LABEL_78:

  return v26;
}

- (id)_parseCharacteristic:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v6])
  {
    id v7 = [v6 UUID];
    id v8 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v7];

    if (v8)
    {
      char v73 = a4;
      id v74 = v6;
      [v6 descriptors];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = [(__CFString *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
      if (v9)
      {
        id v10 = v9;
        id v71 = self;
        v72 = v8;
        id v11 = 0;
        uint64_t v12 = *(void *)v77;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v77 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            char v15 = [v14 UUID];
            long long v16 = +[CBUUID UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
            unsigned int v17 = [v15 isEqual:v16];

            if (v17)
            {
              id v18 = v14;

              id v11 = v18;
            }
          }
          id v10 = [(__CFString *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
        }
        while (v10);
        id v8 = v72;
        if (v11)
        {
          id v19 = sub_100054B2C(v11, v73);
          if (v19)
          {
            uint64_t v20 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
            uint64_t v21 = [v20 characteristicSignatures];
            unsigned __int8 v22 = [v21 objectForKey:v74];

            if (!v22)
            {
              uint64_t v30 = +[NSString stringWithFormat:@"Missing characteristic signature for characteristic: %@", v74];
              id v53 = self;
              id v54 = sub_100083F74();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                id v55 = sub_100083FD0(v53);
                *(_DWORD *)buf = 138543618;
                id v82 = v55;
                __int16 v83 = 2112;
                CFStringRef v84 = (const __CFString *)v30;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
              }
              if (v73)
              {
                +[NSError hapErrorWithcode:9 description:v30 reason:0 suggestion:0 underlyingError:0];
                __int16 v43 = 0;
                *char v73 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                __int16 v43 = 0;
              }
              id v8 = v72;
              goto LABEL_57;
            }
            id v23 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicType];
            id v8 = v72;
            unsigned __int8 v24 = [v23 isEqual:v72];

            if (v24)
            {
              uint64_t v25 = [HAPCharacteristic alloc];
              id v26 = [v72 UUIDString];
              id v27 = [(HAPAccessoryServerBTLE *)self stateNumber];
              id v28 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicProperties];
              id v29 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicMetadata];
              LOBYTE(v70) = 1;
              uint64_t v30 = [(HAPCharacteristic *)v25 initWithType:v26 instanceID:v19 value:0 stateNumber:v27 properties:v28 eventNotificationsEnabled:0 implicitWriteWithResponse:v70 metadata:v29];

              if (v30)
              {
                id v31 = +[NSDate distantPast];
                [v30 setValueUpdatedTime:v31];

                [v30 setCBCharacteristic:v74];
                id v32 = [(_HAPAccessoryServerBTLE200 *)v71 _characteristicForCBCharacteristic:v74];
                if ([(__CFString *)v32 isEqualToCharacteristic:v30]
                  && ([(__CFString *)v32 metadata],
                      id v33 = objc_claimAutoreleasedReturnValue(),
                      [v30 metadata],
                      id v34 = objc_claimAutoreleasedReturnValue(),
                      unsigned int v35 = [v33 isEqualToCharacteristicMetadata:v34],
                      v34,
                      v33,
                      v35))
                {
                  long long v36 = v71;
                  long long v37 = sub_100083F74();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                  {
                    long long v38 = sub_100083FD0(v36);
                    *(_DWORD *)buf = 138543618;
                    id v82 = v38;
                    __int16 v83 = 2112;
                    CFStringRef v84 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@Using existing characteristic: %@", buf, 0x16u);
                  }
                  id v39 = v32;
                  id v32 = (__CFString *)v39;
                }
                else
                {
                  id v39 = v30;
                }
                __int16 v43 = v39;
                id v8 = v72;
              }
              else
              {
                id v62 = [v72 UUIDString];
                id v63 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicProperties];
                long long v64 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicMetadata];
                uint64_t v65 = +[NSString stringWithFormat:@"Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu, metadata, %@", v62, v19, v63, v64];

                long long v66 = v71;
                long long v67 = sub_100083F74();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                {
                  BOOL v68 = sub_100083FD0(v66);
                  *(_DWORD *)buf = 138543618;
                  id v82 = v68;
                  __int16 v83 = 2112;
                  CFStringRef v84 = (const __CFString *)v65;
                  _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
                }
                if (v73)
                {
                  id v32 = (__CFString *)v65;
                  +[NSError hapErrorWithcode:3 description:v65 reason:0 suggestion:0 underlyingError:0];
                  __int16 v43 = 0;
                  *char v73 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  __int16 v43 = 0;
                  id v32 = (__CFString *)v65;
                }
              }

              goto LABEL_57;
            }
            id v56 = [(_HAPAccessoryServerBTLE200 *)v22 characteristicType];
            id v57 = [v56 UUIDString];
            BOOL v58 = [v72 UUIDString];
            uint64_t v30 = +[NSString stringWithFormat:@"The authenticated characteristic type, %@, does not match the characteristic type, %@", v57, v58];

            uint64_t v59 = v71;
            uint64_t v60 = sub_100083F74();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              v61 = sub_100083FD0(v59);
              *(_DWORD *)buf = 138543618;
              id v82 = v61;
              __int16 v83 = 2112;
              CFStringRef v84 = (const __CFString *)v30;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
            }
            if (v73)
            {
              +[NSError hapErrorWithcode:9 description:v30 reason:0 suggestion:0 underlyingError:0];
              __int16 v43 = 0;
              *char v73 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

              id v6 = v74;
              goto LABEL_58;
            }
          }
          else
          {
            unsigned __int8 v22 = self;
            uint64_t v30 = sub_100083F74();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v52 = sub_100083FD0(v22);
              *(_DWORD *)buf = 138543362;
              id v82 = v52;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Characteristic Instance ID", buf, 0xCu);
            }
          }
          __int16 v43 = 0;
          goto LABEL_57;
        }
      }
      id v44 = self;
      __int16 v45 = sub_100083F74();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v46 = sub_100083FD0(v44);
        *(_DWORD *)buf = 138543618;
        id v82 = v46;
        __int16 v83 = 2112;
        CFStringRef v84 = @"Characteristic missing characteristic instance ID descriptor";
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v6 = v74;
      if (v73)
      {
        +[NSError hapErrorWithcode:9 description:@"Characteristic missing characteristic instance ID descriptor" reason:0 suggestion:0 underlyingError:0];
        __int16 v43 = 0;
        *char v73 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

        goto LABEL_59;
      }
    }
    else
    {
      __int16 v47 = [v6 UUID];
      id obj = +[NSString stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v47];

      unsigned __int8 v48 = self;
      long long v49 = sub_100083F74();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        sub_100083FD0(v48);
        uint64_t v51 = v50 = a4;
        *(_DWORD *)buf = 138543618;
        id v82 = v51;
        __int16 v83 = 2112;
        CFStringRef v84 = obj;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        a4 = v50;
      }

      if (a4)
      {
        +[NSError hapErrorWithcode:3 description:obj reason:0 suggestion:0 underlyingError:0];
        __int16 v43 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_58;
      }
    }
    __int16 v43 = 0;
    goto LABEL_58;
  }
  id v40 = self;
  __int16 v41 = sub_100083F74();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    id v42 = sub_100083FD0(v40);
    *(_DWORD *)buf = 138543618;
    id v82 = v42;
    __int16 v83 = 2112;
    CFStringRef v84 = @"Characteristic does not support HAP";
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
  }
  if (a4)
  {
    +[NSError hapErrorWithcode:3 description:@"Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
    __int16 v43 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v43 = 0;
  }
LABEL_59:

  return v43;
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc((Class)HMFActivity);
  uint64_t v14 = HMFMethodDescription();
  char v15 = +[NSString stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4214];
  id v16 = [v13 initWithName:v15];

  unsigned int v17 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B808;
  block[3] = &unk_100273A78;
  id v23 = v10;
  unsigned __int8 v24 = self;
  id v26 = v11;
  id v27 = v12;
  double v28 = a4;
  id v25 = v16;
  id v18 = v11;
  id v19 = v12;
  id v20 = v16;
  id v21 = v10;
  dispatch_async(v17, block);
}

- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = a5;
  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  id v10 = dispatch_group_create();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    uint64_t v14 = v38;
    id v31 = self;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        dispatch_group_enter(v10);
        unsigned int v17 = sub_100083F74();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = sub_100083FD0(0);
          [v16 instanceID];
          id v19 = v10;
          id v20 = v12;
          id v21 = v14;
          uint64_t v22 = v13;
          v24 = id v23 = v9;
          *(_DWORD *)buf = 138543618;
          unsigned __int8 v46 = v18;
          __int16 v47 = 2112;
          unsigned __int8 v48 = v24;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Sending read for characteristic %{key:characteristicId}@", buf, 0x16u);

          id v9 = v23;
          uint64_t v13 = v22;
          uint64_t v14 = v21;
          id v12 = v20;
          id v10 = v19;
          self = v31;
        }
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v38[0] = sub_10005C198;
        v38[1] = &unk_100273AA0;
        v38[2] = self;
        id v39 = v9;
        id v40 = v10;
        [(_HAPAccessoryServerBTLE200 *)self _readValueForCharacteristic:v16 options:1 completionHandler:v37];
      }
      id v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v12);
  }

  id v25 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C310;
  block[3] = &unk_100273AC8;
  void block[4] = self;
  id v34 = v30;
  id v35 = v9;
  id v36 = v29;
  id v26 = v9;
  id v27 = v29;
  id v28 = v30;
  dispatch_group_notify(v10, v25, block);
}

- (void)_updatePropertiesFromCharacteristic:(id)a3
{
  id v9 = a3;
  id v4 = [v9 type];
  unsigned __int8 v5 = [(HAPAccessoryServer *)self primaryAccessory];
  if ([v4 isEqualToString:@"00000220-0000-1000-8000-4D69736D6574"])
  {
    id v6 = [v9 value];
    id v7 = +[HAPAccessory productDataStringFromData:v6];
    [(HAPAccessoryServer *)self setProductData:v7];

    id v8 = [(HAPAccessoryServer *)self productData];
    [v5 setProductData:v8];
  }
}

- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 service];
  id v11 = [v10 accessory];
  id v12 = [v11 server];

  if (v12 == self)
  {
    id v30 = 0;
    unsigned int v17 = [(id)objc_opt_class() readRequestForCharacteristic:v8 options:a4 error:&v30];
    id v16 = v30;
    if (v17)
    {
      id v18 = objc_alloc((Class)HMFActivity);
      id v19 = HMFMethodDescription();
      id v20 = +[NSString stringWithFormat:@"%@, %s:%ld", v19, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4352];
      *(void *)buf = [v18 initWithName:v20];

      objc_initWeak(&location, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10005CA68;
      v25[3] = &unk_100273AF0;
      objc_copyWeak(&v28, &location);
      id v26 = v8;
      id v27 = v9;
      id v21 = objc_retainBlock(v25);
      [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v17 shouldPrioritize:((unint64_t)a4 >> 1) & 1 responseHandler:v21];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      __HMFActivityScopeLeave();
    }
    else
    {
      uint64_t v22 = self;
      id v23 = sub_100083F74();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v24 = sub_100083FD0(v22);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v24;
        __int16 v32 = 2112;
        id v33 = v8;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Read failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);
      }
      sub_10005C938(v8, v9, 1, v16, @"Failed to create request.");
    }
  }
  else
  {
    uint64_t v13 = self;
    uint64_t v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Read failed, characteristic is not part of server: %@", buf, 0x16u);
    }
    id v16 = +[NSError hapErrorWithcode:11];
    sub_10005C938(v8, v9, 1, v16, @"Characteristic is not part of server.");
  }
}

+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v7 = a3;
  if (([v7 properties] & 2) != 0)
  {
    a5 = [[HAPBTLERequest alloc] initWithCharacteristic:v7 requestType:3 bodyData:0 shouldEncrypt:v6 & 1 timeoutInterval:10.0];
  }
  else
  {
    id v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Read failed, characteristic does not support secured reads: %@", buf, 0x16u);
    }
    if (a5)
    {
      id v10 = +[NSString stringWithFormat:@"Failed to read from characteristic %@.", v7];
      *a5 = +[NSError hapErrorWithcode:11 description:v10 reason:@"Characteristic does not support secured reads." suggestion:0 underlyingError:0];

      a5 = 0;
    }
  }

  return a5;
}

+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 request];
  unsigned int v11 = [v10 type];

  id v35 = a5;
  if (v11 != 3)
  {
    uint64_t v33 = 4294960591;
LABEL_25:
    id v28 = +[NSError errorWithOSStatus:v33];
    id v14 = +[NSError hapErrorWithcode:1 description:@"Read failed." reason:@"Failed to parse read request body." suggestion:0 underlyingError:v28];
    uint64_t v13 = 0;
    id v26 = 0;
    id v21 = 0;
    goto LABEL_9;
  }
  id v12 = [v9 body];
  id v38 = 0;
  uint64_t v13 = [a1 extractSerializedRequestValueFromBodyData:v12 error:&v38];
  id v14 = v38;

  if (!v13)
  {
    if (v14)
    {
      id v21 = 0;
      id v26 = 0;
      uint64_t v13 = 0;
      goto LABEL_10;
    }
    uint64_t v33 = 4294960559;
    goto LABEL_25;
  }
  id v15 = [v9 request];
  id v16 = [v15 characteristic];
  unsigned int v17 = [v16 metadata];
  id v18 = [v17 format];
  uint64_t v19 = sub_10007AD38(v18);

  id v20 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v37 = v14;
  id v21 = [v20 reverseTransformedValue:v13 format:v19 error:&v37];
  id v22 = v37;

  if (v22)
  {
    id v26 = 0;
    id v14 = v22;
    goto LABEL_10;
  }
  id v23 = [v9 request];
  unsigned __int8 v24 = [v23 characteristic];
  unsigned __int16 v25 = (unsigned __int16)[v24 properties];

  if ((v25 & 0x100) != 0)
  {
    id v27 = [v9 body];
    id v36 = 0;
    id v26 = [a1 extractNotificationContextFromBodyData:v27 error:&v36];
    id v14 = v36;

    id v28 = a1;
    id v29 = sub_100083F74();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = sub_100083FD0(v28);
      *(_DWORD *)buf = 138543874;
      id v40 = v30;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      id v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}@Parsed read response notification context: %@ with error: %@", buf, 0x20u);
    }
LABEL_9:

    if (!v14) {
      goto LABEL_12;
    }
LABEL_10:
    if (a6)
    {
      id v14 = v14;
      BOOL v31 = 0;
      *a6 = v14;
    }
    else
    {
      BOOL v31 = 0;
    }
    goto LABEL_18;
  }
  id v26 = 0;
LABEL_12:
  if (a4) {
    *a4 = v21;
  }
  if (v26)
  {
    id v26 = v26;
    id v14 = 0;
    *id v35 = v26;
  }
  else
  {
    id v14 = 0;
  }
  BOOL v31 = 1;
LABEL_18:

  return v31;
}

+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = TLV8GetOrCopyCoalesced();
  if (v6)
  {
    if (a4)
    {
      id v7 = +[NSError errorWithOSStatus:v6];
      *a4 = +[NSError hapErrorWithcode:12 description:@"Parse failed." reason:@"Failed to parse request body." suggestion:0 underlyingError:v7];

      a4 = 0;
    }
  }
  else
  {
    a4 = +[NSData dataWithBytes:0 length:0];
  }

  return a4;
}

+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = TLV8GetOrCopyCoalesced();
  if (v6)
  {
    id v7 = 0;
    if (a4 && v6 != -6727)
    {
      id v8 = +[NSError errorWithOSStatus:v6];
      *a4 = +[NSError hapErrorWithcode:12 description:@"Parse failed." reason:@"Failed to parse notification context." suggestion:0 underlyingError:v8];

      id v7 = 0;
    }
  }
  else
  {
    id v7 = +[NSData dataWithBytes:0 length:0];
  }

  return v7;
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc((Class)HMFActivity);
  id v14 = HMFMethodDescription();
  id v15 = +[NSString stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4574];
  id v16 = [v13 initWithName:v15];

  unsigned int v17 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D804;
  block[3] = &unk_100273B40;
  double v27 = a4;
  void block[4] = self;
  id v23 = v10;
  id v24 = v16;
  id v25 = v11;
  id v26 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v16;
  id v21 = v10;
  dispatch_async(v17, block);
}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, id, void *))a8;
  id v19 = [v15 service];
  id v20 = [v19 accessory];
  id v21 = [v20 server];

  if (v21 == self)
  {
    if ((a7 & 4) != 0 || ([v15 properties] & 0x20) != 0)
    {
      id v30 = self;
      BOOL v31 = sub_100083F74();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        __int16 v32 = sub_100083FD0(v30);
        *(_DWORD *)buf = 138543618;
        __int16 v34 = v32;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristic %@", buf, 0x16u);
      }
      [(_HAPAccessoryServerBTLE200 *)v30 _performTimedWriteValue:v14 toCharacteristic:v15 authorizationData:v16 contextData:v17 options:a7 completionHandler:v18];
    }
    else
    {
      double v27 = self;
      id v28 = sub_100083F74();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = sub_100083FD0(v27);
        *(_DWORD *)buf = 138543618;
        __int16 v34 = v29;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristic %@", buf, 0x16u);
      }
      [(_HAPAccessoryServerBTLE200 *)v27 _performWriteValue:v14 toCharacteristic:v15 authorizationData:v16 contextData:v17 options:a7 completionHandler:v18];
    }
  }
  else
  {
    id v22 = self;
    id v23 = sub_100083F74();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = sub_100083FD0(v22);
      *(_DWORD *)buf = 138543618;
      __int16 v34 = v24;
      __int16 v35 = 2112;
      id v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Write failed, characteristic is not part of server: %@", buf, 0x16u);
    }
    if (v18)
    {
      id v25 = +[NSString stringWithFormat:@"Failed to write to characteristic %@.", v15];
      id v26 = +[NSError hapErrorWithcode:10 description:v25 reason:@"Characteristic is not part of server." suggestion:0 underlyingError:0];

      v18[2](v18, v15, v26);
    }
  }
}

- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v29 = a5;
  id v30 = a6;
  id v16 = a8;
  id v17 = objc_alloc((Class)HMFActivity);
  id v18 = HMFMethodDescription();
  id v19 = +[NSString stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4711];
  id v38 = [v17 initWithName:v19];

  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10005E6C8;
  v32[3] = &unk_100273B68;
  objc_copyWeak(v36, &location);
  id v20 = v15;
  id v33 = v20;
  id v21 = v16;
  id v35 = v21;
  id v22 = v14;
  id v34 = v22;
  v36[1] = (id)a7;
  id v23 = objc_retainBlock(v32);
  id v31 = 0;
  id v24 = [(id)objc_opt_class() writeRequestForCharacteristic:v20 value:v22 authorizationData:v29 contextData:v30 options:a7 error:&v31];
  id v25 = v31;
  if (v24)
  {
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v24 shouldPrioritize:((unint64_t)a7 >> 4) & 1 responseHandler:v23];
  }
  else
  {
    id v26 = self;
    sub_100083F74();
    double v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = sub_100083FD0(v26);
      *(_DWORD *)buf = 138543874;
      id v40 = v28;
      __int16 v41 = 2112;
      id v42 = v20;
      __int16 v43 = 2112;
      id v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@Write failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);
    }
    sub_10005C938(v20, v21, 2, v25, @"Failed to create request.");
  }

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
}

- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005EC80;
  v21[3] = &unk_100273B90;
  v21[4] = self;
  id v22 = a4;
  id v23 = v14;
  id v24 = a8;
  int64_t v25 = a7;
  id v15 = v14;
  id v16 = v22;
  id v17 = v24;
  id v18 = a6;
  id v19 = a5;
  id v20 = objc_retainBlock(v21);
  [(_HAPAccessoryServerBTLE200 *)self _performTimedWritePrepareWithValue:v15 toCharacteristic:v16 authorizationData:v19 contextData:v18 options:a7 completionHandler:v20];
}

- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v39 = 0;
  __int16 v32 = v14;
  id v33 = v16;
  id v19 = [(id)objc_opt_class() prepareWriteRequestForCharacteristic:v15 value:v14 authorizationData:v16 contextData:v17 options:a7 error:&v39];
  id v34 = v39;
  if (v19)
  {
    id v20 = objc_alloc((Class)HMFActivity);
    id v21 = HMFMethodDescription();
    id v22 = +[NSString stringWithFormat:@"%@, %s:%ld", v21, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4850];
    id v38 = [v20 initWithName:v22];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10005F10C;
    v35[3] = &unk_100273BB8;
    v35[4] = self;
    id v23 = v15;
    id v36 = v23;
    id v37 = v18;
    id v24 = objc_retainBlock(v35);
    sub_100083F74();
    int64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_100083FD0(0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      double v27 = [v23 instanceID];
      *(_DWORD *)buf = 138543618;
      id v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Sending timed write for characteristic %{key:characteristicId}@", buf, 0x16u);
    }
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v19 shouldPrioritize:((unint64_t)a7 >> 4) & 1 responseHandler:v24];

    __HMFActivityScopeLeave();
  }
  else
  {
    id v28 = self;
    id v29 = sub_100083F74();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = sub_100083FD0(v28);
      *(_DWORD *)buf = 138543874;
      id v41 = v30;
      __int16 v42 = 2112;
      id v43 = v15;
      __int16 v44 = 2112;
      id v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@Timed write prepare failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);
    }
    id v31 = +[NSError hapErrorWithcode:10];
    sub_10005C938(v15, v18, 2, v31, @"Failed to create prepare-write request.");
  }
}

- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v28 = 0;
  id v13 = [(id)objc_opt_class() executeWriteRequestForCharacteristic:v10 options:a5 error:&v28];
  id v14 = v28;
  if (v13)
  {
    objc_initWeak((id *)location, self);
    id v15 = objc_alloc((Class)HMFActivity);
    id v16 = HMFMethodDescription();
    id v17 = +[NSString stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4916];
    id v27 = [v15 initWithName:v17];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005F78C;
    v22[3] = &unk_100273B68;
    objc_copyWeak(v26, (id *)location);
    id v23 = v10;
    id v25 = v12;
    id v24 = v11;
    v26[1] = (id)a5;
    id v18 = objc_retainBlock(v22);
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v13 shouldPrioritize:1 responseHandler:v18];

    objc_destroyWeak(v26);
    __HMFActivityScopeLeave();

    objc_destroyWeak((id *)location);
  }
  else
  {
    id v19 = self;
    id v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = sub_100083FD0(v19);
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v21;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Timed write execute failed, failed to create request for characteristic, %@, with error: %@", location, 0x20u);
    }
    sub_10005C938(v10, v12, 2, v14, @"Failed to create execute-write request.");
  }
}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (([v14 properties] & 4) != 0)
  {
    id v23 = [v14 metadata];
    id v24 = [v23 format];
    uint64_t v25 = sub_10007AD38(v24);

    id v26 = sub_10005FF64(v15, v25, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 0.0);
    if (v26)
    {
      if ((a7 & 8) != 0) {
        double v27 = 60.0;
      }
      else {
        double v27 = 10.0;
      }
      id v22 = [[HAPBTLERequest alloc] initWithCharacteristic:v14 requestType:2 bodyData:v26 shouldEncrypt:a7 & 1 timeoutInterval:v27];
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v18 = a1;
    id v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = sub_100083FD0(v18);
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v20;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);
    }
    if (a8)
    {
      id v21 = +[NSString stringWithFormat:@"Failed to write to characteristic %@.", v14];
      *a8 = +[NSError hapErrorWithcode:10 description:v21 reason:@"Characteristic does not support secured writes." suggestion:0 underlyingError:0];
    }
    id v22 = 0;
  }

  return v22;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (([v14 properties] & 4) != 0)
  {
    id v22 = [v14 metadata];
    id v23 = [v22 format];
    uint64_t v24 = sub_10007AD38(v23);

    uint64_t v25 = sub_10005FF64(v15, v24, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 2.5);
    if (v25) {
      a8 = [[HAPBTLERequest alloc] initWithCharacteristic:v14 requestType:4 bodyData:v25 shouldEncrypt:a7 & 1 timeoutInterval:2.5];
    }
    else {
      a8 = 0;
    }
  }
  else
  {
    id v18 = a1;
    id v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = sub_100083FD0(v18);
      *(_DWORD *)buf = 138543618;
      id v28 = v20;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);
    }
    if (a8)
    {
      id v21 = +[NSString stringWithFormat:@"Failed to write to characteristic %@.", v14];
      *a8 = +[NSError hapErrorWithcode:10 description:v21 reason:@"Characteristic does not support secured writes." suggestion:0 underlyingError:0];

      a8 = 0;
    }
  }

  return a8;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = a3;
  if (([v8 properties] & 4) != 0)
  {
    a5 = [[HAPBTLERequest alloc] initWithCharacteristic:v8 requestType:5 bodyData:0 shouldEncrypt:v6 & 1 timeoutInterval:10.0];
  }
  else
  {
    id v9 = a1;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = sub_100083FD0(v9);
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);
    }
    if (a5)
    {
      id v12 = +[NSString stringWithFormat:@"Failed to write to characteristic %@.", v8];
      *a5 = +[NSError hapErrorWithcode:11 description:v12 reason:@"Characteristic does not support secured writes." suggestion:0 underlyingError:0];

      a5 = 0;
    }
  }

  return a5;
}

+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 request];
  unsigned int v10 = [v9 type];

  if (v10 == 5 || v10 == 2)
  {
    id v12 = [v8 body];
    id v27 = 0;
    id v13 = [a1 extractSerializedRequestValueFromBodyData:v12 error:&v27];
    id v14 = v27;

    if (v13)
    {
      id v15 = [v8 request];
      __int16 v16 = [v15 characteristic];
      id v17 = [v16 metadata];
      id v18 = [v17 format];
      uint64_t v19 = sub_10007AD38(v18);

      id v20 = +[HAPDataValueTransformer defaultDataValueTransformer];
      id v26 = v14;
      id v21 = [v20 reverseTransformedValue:v13 format:v19 error:&v26];
      id v22 = v26;

      id v14 = v22;
      goto LABEL_9;
    }
    if (v14)
    {
      id v13 = 0;
      id v21 = 0;
      if (a5) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
    uint64_t v23 = 4294960559;
  }
  else
  {
    uint64_t v23 = 4294960591;
  }
  id v20 = +[NSError errorWithOSStatus:v23];
  id v14 = +[NSError hapErrorWithcode:12 description:@"Write failed." reason:@"Failed to parse write request body." suggestion:0 underlyingError:v20];
  id v21 = 0;
  id v13 = 0;
LABEL_9:

  if (v14)
  {
    if (a5)
    {
LABEL_11:
      id v14 = v14;
      BOOL v24 = 0;
      *a5 = v14;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v24 = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    id v21 = v21;
    id v14 = 0;
    *a4 = v21;
  }
  else
  {
    id v14 = 0;
  }
  BOOL v24 = 1;
LABEL_19:

  return v24;
}

- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3
{
  id v10 = a3;
  if ([v10 properties])
  {
    id v4 = [(HAPAccessoryServerBTLE *)self browser];
    id v5 = [(HAPAccessoryServer *)self identifier];
    [v4 markNotifyingCharacteristicUpdatedForIdentifier:v5];

    if (![(HAPAccessoryServerBTLE *)self notifyingCharacteristicUpdated])
    {
      [(HAPAccessoryServerBTLE *)self setNotifyingCharacteristicUpdated:1];
      char v6 = [(HAPAccessoryServerBTLE *)self stateNumber];
      unsigned __int16 v7 = (unsigned __int16)[v6 unsignedShortValue];

      id v8 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)(v7 + 1)];
      [(HAPAccessoryServerBTLE *)self setStateNumber:v8];
    }
    id v9 = [(HAPAccessoryServerBTLE *)self stateNumber];
    [v10 setStateNumber:v9];
  }
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(HAPAccessoryServerBTLE *)self stateChanged])
  {
    id v13 = [(HAPAccessoryServer *)self clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060B90;
    block[3] = &unk_100273BE0;
    BOOL v36 = a3;
    id v14 = &v33;
    void block[4] = self;
    id v33 = v10;
    id v15 = &v35;
    __int16 v16 = &v34;
    id v34 = v12;
    id v35 = v11;
    id v17 = v12;
    id v18 = v11;
    id v19 = v10;
    dispatch_async(v13, block);
  }
  else
  {
    id v20 = self;
    id v21 = sub_100083F74();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = sub_100083FD0(v20);
      *(_DWORD *)buf = 138543362;
      id v38 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@Deferring enable events to prioritize local commands", buf, 0xCu);
    }
    dispatch_time_t v23 = dispatch_time(0, 1000000000);
    id v13 = [(HAPAccessoryServer *)v20 clientQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100060BA4;
    v27[3] = &unk_100273BE0;
    BOOL v31 = a3;
    id v14 = &v28;
    v27[4] = v20;
    id v28 = v10;
    id v15 = &v30;
    __int16 v16 = &v29;
    id v29 = v12;
    id v30 = v11;
    id v24 = v12;
    id v25 = v11;
    id v26 = v10;
    dispatch_after(v23, v13, v27);
  }
}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v8 = a3;
  id v56 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v57 = a5;
  v61 = a6;
  uint64_t v65 = self;
  id v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_100083FD0(v65);
    CFStringRef v12 = @"Disabling";
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2112;
    if (v8) {
      CFStringRef v12 = @"Enabling";
    }
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    __int16 v112 = v56;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@%@ events for characteristics: %@", buf, 0x20u);
  }
  if ((id)[(_HAPAccessoryServerBTLE200 *)v65 connectionState] == (id)2)
  {
    id v58 = +[NSMutableArray array];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v13 = v56;
    id v14 = [v13 countByEnumeratingWithState:&v91 objects:v115 count:16];
    if (v14)
    {
      id obj = 0;
      uint64_t v15 = *(void *)v92;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v92 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if ([v17 eventNotificationsEnabled] == v8)
          {
            id v18 = v65;
            id v19 = sub_100083F74();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              id v20 = sub_100083FD0(v18);
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@Events already enabled for %@", buf, 0x16u);
            }
            ++obj;
          }
          else if ([v17 properties])
          {
            [v58 addObject:v17];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v91 objects:v115 count:16];
      }
      while (v14);
    }
    else
    {
      id obj = 0;
    }

    id v26 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v112 = sub_1000617EC;
    v113 = sub_1000617FC;
    id v114 = 0;
    id v55 = v26;
    if ([v58 count])
    {
      dispatch_group_enter(v26);
      id v27 = +[NSMutableArray array];
      group = dispatch_group_create();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id obja = v13;
      id v28 = [obja countByEnumeratingWithState:&v87 objects:v110 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v88;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v88 != v29) {
              objc_enumerationMutation(obja);
            }
            BOOL v31 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
            dispatch_group_enter(group);
            v83[0] = _NSConcreteStackBlock;
            v83[1] = 3221225472;
            v83[2] = sub_100061804;
            v83[3] = &unk_100273C08;
            BOOL v86 = v8;
            v83[4] = v65;
            id v84 = v27;
            v85 = group;
            id v32 = objc_retainBlock(v83);
            [(_HAPAccessoryServerBTLE200 *)v65 _enableEvent:v8 forCharacteristic:v31 withCompletionHandler:v32 queue:v61];
            [v31 setEventNotificationsEnabled:v8];
          }
          id v28 = [obja countByEnumeratingWithState:&v87 objects:v110 count:16];
        }
        while (v28);
      }

      dispatch_group_leave(v55);
      id v33 = [(HAPAccessoryServer *)v65 clientQueue];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1000619DC;
      v77[3] = &unk_100273C58;
      v77[4] = v65;
      id v78 = v58;
      long long v79 = v61;
      id v82 = buf;
      id v80 = v27;
      id v81 = v57;
      id v34 = v27;
      dispatch_group_notify(v55, v33, v77);
    }
    else
    {
      group = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v35 = v13;
      id v36 = [v35 countByEnumeratingWithState:&v73 objects:v109 count:16];
      if (v36)
      {
        uint64_t v59 = *(void *)v74;
        do
        {
          id v60 = v36;
          for (k = 0; k != v60; k = (char *)k + 1)
          {
            if (*(void *)v74 != v59) {
              objc_enumerationMutation(v35);
            }
            id v38 = *(void **)(*((void *)&v73 + 1) + 8 * (void)k);
            if ([v38 eventNotificationsEnabled] == v8)
            {
              id v39 = 0;
            }
            else
            {
              id v39 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6711 userInfo:0];
              id v40 = v65;
              sub_100083F74();
              id v41 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                sub_100083FD0(v40);
                id v42 = (id)objc_claimAutoreleasedReturnValue();
                id v43 = [v38 instanceID];
                __int16 v44 = [v38 type];
                *(_DWORD *)long long v101 = 138544130;
                id v102 = v42;
                __int16 v103 = 2112;
                id v104 = v43;
                __int16 v105 = 2112;
                v106 = v44;
                __int16 v107 = 2112;
                CFStringRef v108 = v39;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", v101, 0x2Au);
              }
            }
            id v45 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v38 error:v39];
            if (v45) {
              [group addObject:v45];
            }
          }
          id v36 = [v35 countByEnumeratingWithState:&v73 objects:v109 count:16];
        }
        while (v36);
      }

      if (obj == [v35 count])
      {
        if (!v57 || !v61) {
          goto LABEL_36;
        }
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_100061FCC;
        v70[3] = &unk_1002733F0;
        id v72 = v57;
        group = group;
        id v71 = group;
        dispatch_async(v61, v70);

        id v34 = v72;
      }
      else
      {
        v99[0] = NSLocalizedDescriptionKey;
        unsigned __int8 v46 = +[NSString stringWithFormat:@"Failed to enable events for characteristic %@", v35];
        v100[0] = v46;
        v99[1] = NSLocalizedFailureReasonErrorKey;
        __int16 v47 = +[NSBundle mainBundle];
        unsigned __int8 v48 = [v47 localizedStringForKey:@"No Characteristics support notify property" value:&stru_10027B0E8 table:0];
        v100[1] = v48;
        id v34 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];

        uint64_t v49 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6735 userInfo:v34];
        long long v50 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v49;

        uint64_t v51 = v65;
        sub_100083F74();
        uint64_t v52 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          id v53 = sub_100083FD0(v51);
          id v54 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)long long v101 = 138543618;
          id v102 = v53;
          __int16 v103 = 2112;
          id v104 = v54;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events for characteristic with error: %@", v101, 0x16u);
        }
        if (v57 && v61)
        {
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_100061FE4;
          v66[3] = &unk_100273C80;
          id v68 = v57;
          group = group;
          long long v67 = group;
          uint64_t v69 = buf;
          dispatch_async(v61, v66);
        }
      }
    }

LABEL_36:
    _Block_object_dispose(buf, 8);

    id v25 = v55;
    goto LABEL_37;
  }
  id v21 = v65;
  id v22 = sub_100083F74();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v23 = sub_100083FD0(v21);
    int64_t v24 = [(_HAPAccessoryServerBTLE200 *)v21 connectionState];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting enabling events on server that is not connected, current state: %tu", buf, 0x16u);
  }
  id v58 = +[NSError errorWithDomain:@"HAPErrorDomain" code:2 userInfo:0];
  if (v57 && v61)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000617D4;
    block[3] = &unk_100273378;
    long long v98 = v57;
    long long v96 = v56;
    id v58 = v58;
    id v97 = v58;
    dispatch_async(v61, block);

    id v25 = v98;
LABEL_37:
  }
}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  CFStringRef v12 = a6;
  id v13 = [v10 cbCharacteristic];
  id v14 = self;
  uint64_t v15 = sub_100083F74();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = sub_100083FD0(v14);
    *(_DWORD *)buf = 138543874;
    __int16 v44 = v16;
    __int16 v45 = 1024;
    BOOL v46 = v8;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Enable Events :%d for Characteristics: %@", buf, 0x1Cu);
  }
  if (!v13)
  {
    v41[0] = NSLocalizedDescriptionKey;
    dispatch_time_t v23 = +[NSString stringWithFormat:@"Failed to enable events for characteristic %@", v10];
    v42[0] = v23;
    v41[1] = NSLocalizedFailureReasonErrorKey;
    int64_t v24 = +[NSBundle mainBundle];
    id v25 = [v24 localizedStringForKey:@"Unable to find matching BTLE characteristic" value:&stru_10027B0E8 table:0];
    v42[1] = v25;
    id v20 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

    id v21 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6727 userInfo:v20];
    if (!v11 || !v12) {
      goto LABEL_12;
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000624A4;
    v35[3] = &unk_100273378;
    id v38 = v11;
    id v36 = v10;
    id v37 = v21;
    dispatch_async(v12, v35);

    id v22 = v38;
    goto LABEL_11;
  }
  if (([v13 properties] & 0x20) != 0)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000624D4;
    v27[3] = &unk_100273CA8;
    BOOL v30 = v8;
    v27[4] = v14;
    id v29 = v11;
    id v28 = v12;
    id v26 = objc_retainBlock(v27);
    [(_HAPAccessoryServerBTLE200 *)v14 _performEnableEvent:v8 toCharacteristic:v10 completionHandler:v26];

    goto LABEL_14;
  }
  v39[0] = NSLocalizedDescriptionKey;
  id v17 = +[NSString stringWithFormat:@"Failed to enable events for characteristic %@", v10];
  v40[0] = v17;
  v39[1] = NSLocalizedFailureReasonErrorKey;
  id v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"BTLE characteristic does not support indication" value:&stru_10027B0E8 table:0];
  v40[1] = v19;
  id v20 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  id v21 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6735 userInfo:v20];
  if (v11 && v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000624BC;
    block[3] = &unk_100273378;
    id v34 = v11;
    id v32 = v10;
    id v33 = v21;
    dispatch_async(v12, block);

    id v22 = v34;
LABEL_11:
  }
LABEL_12:

LABEL_14:
}

- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1000627C8;
  __int16 v16 = &unk_100273710;
  id v17 = a4;
  id v18 = a5;
  id v8 = v17;
  id v9 = v18;
  [(_HAPAccessoryServerBTLE200 *)self _enableEvent:v6 toCharacteristic:v8 completionHandler:&v13];
  id v10 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  if ([v10 isOpen])
  {
  }
  else
  {
    id v11 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    unsigned __int8 v12 = [v11 isOpening];

    if ((v12 & 1) == 0)
    {
      [(_HAPAccessoryServerBTLE200 *)self _suspendAllOperations];
      [(HAPAccessoryServer *)self setMetric_pairVerifyReason:@"noSession.event"];
      [(_HAPAccessoryServerBTLE200 *)self _establishSecureSession];
    }
  }
}

- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 cbCharacteristic];
  if (v10)
  {
    id v11 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
    id v12 = [v9 copy];
    id v13 = objc_retainBlock(v12);
    [v11 setObject:v13 forKey:v8];

    uint64_t v14 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v14 setNotifyValue:v6 forCharacteristic:v10];
  }
  else
  {
    uint64_t v15 = self;
    __int16 v16 = sub_100083F74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = sub_100083FD0(v15);
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v19, 0x16u);
    }
    if (v9)
    {
      id v18 = +[NSError hapErrorWithcode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
      (*((void (**)(id, void *))v9 + 2))(v9, v18);
    }
  }
}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
    [v10 removeObjectForKey:v6];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    ((void (**)(void, id))v9)[2](v9, v7);
  }
  else
  {
    id v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = sub_100083FD0(v11);
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Received unexpected notification updated completion from characteristic, %@, dropping", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_handleEventIndicationForCharacteristic:(id)a3
{
  id v4 = a3;
  if ([v4 properties])
  {
    id v5 = self;
    id v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_100083FD0(v5);
      *(_DWORD *)buf = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Reading value on Indication for characteristic %@", buf, 0x16u);
    }
    [(_HAPAccessoryServerBTLE200 *)v5 markNotifyingCharacteristicUpdatedforCharacteristic:v4];
    id v8 = +[NSArray arrayWithObject:v4];
    id v9 = [(HAPAccessoryServer *)v5 clientQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100062CA0;
    v10[3] = &unk_1002733C8;
    v10[4] = v5;
    [(_HAPAccessoryServerBTLE200 *)v5 _readCharacteristicValues:v8 queue:v9 completionHandler:v10];
  }
}

+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  id v7 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  TLV8BufferInit();
  if (v6 != 2 && (uint64_t v8 = TLV8BufferAppend(), v8) || (uint64_t v8 = TLV8BufferAppend(), v8))
  {
    uint64_t v9 = v8;
    id v10 = 0;
  }
  else
  {
    id v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v28);
    if (v10) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 4294960568;
    }
  }
  TLV8BufferFree();
  if (a5 && v9)
  {
    id v11 = +[NSError errorWithOSStatus:v9];
    *a5 = +[NSError hapErrorWithcode:12 description:@"Protocol configuration failed" reason:@"Failed to create protocol configuration body" suggestion:0 underlyingError:v11];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = [v7 characteristics];
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13)
  {
LABEL_21:

    goto LABEL_24;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v24;
LABEL_12:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v24 != v15) {
      objc_enumerationMutation(v12);
    }
    id v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
    id v18 = [v17 cbCharacteristic];
    if (!sub_1000548F4(v18))
    {

      goto LABEL_19;
    }
    unsigned __int8 v19 = [v7 serviceProperties];

    if ((v19 & 4) != 0) {
      break;
    }
LABEL_19:
    if (v14 == (id)++v16)
    {
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  id v20 = v17;

  if (v20)
  {
    __int16 v21 = [[HAPBTLERequest alloc] initWithCharacteristic:v20 requestType:8 bodyData:v10 shouldEncrypt:1 timeoutInterval:10.0];

    goto LABEL_27;
  }
LABEL_24:
  if (a5)
  {
    +[NSError hapErrorWithcode:3 description:@"Protocol configuration request create failed" reason:@"Service is missing service signature charactersitic or support for configuration" suggestion:0 underlyingError:0];
    __int16 v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v21 = 0;
  }
LABEL_27:

  return v21;
}

+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 body];
  [v10 bytes];

  id v11 = [v9 body];
  [v11 length];

  uint64_t v38 = 0;
  uint64_t v39 = 0;
  long long v37 = 0;
  unsigned __int16 v36 = 0;
  unsigned __int8 v35 = 0;
  __int16 v34 = 0;
  int __s = 0;
  id v12 = [v9 request];

  LODWORD(v9) = [v12 type];
  if (v9 == 8)
  {
    id v13 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      id v13 = +[NSData dataWithBytes:v39 length:v38];
    }
    if (TLV8GetOrCopyCoalesced())
    {
      id v14 = v13;
    }
    else
    {
      id v14 = +[NSData dataWithBytes:v39 length:v38];

      if (v37)
      {
        free(v37);
        long long v37 = 0;
      }
      if (v38 == 1) {
        [v14 getBytes:&v35 range:0];
      }
    }
    if (TLV8GetOrCopyCoalesced())
    {
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = +[NSData dataWithBytes:v39 length:v38];

      if (v37)
      {
        free(v37);
        long long v37 = 0;
      }
      memset_s(&__s, 6uLL, 0, 6uLL);
      if (v38 == 6) {
        [v15 getBytes:&__s range:0, 6];
      }
    }
    if (TLV8GetOrCopyCoalesced()) {
      goto LABEL_17;
    }
    id v18 = +[NSData dataWithBytes:v39 length:v38];

    if (v37)
    {
      free(v37);
      long long v37 = 0;
    }
    if (v18)
    {
      memset_s(v56, 0x20uLL, 0, 0x20uLL);
      uint64_t v19 = v38;
      if (v38 == 32)
      {
        [v18 getBytes:v56 range:0, 32];
        +[NSData dataWithBytes:v56 length:32];
        uint64_t v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v20 = 4294960591;
      }
      id v21 = a1;
      id v22 = sub_100083F74();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        long long v23 = sub_100083FD0(v21);
        *(_DWORD *)buf = 138545410;
        long long v41 = v23;
        __int16 v42 = 1024;
        *(_DWORD *)long long v43 = v36;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v35;
        __int16 v44 = 1024;
        int v45 = __s;
        __int16 v46 = 1024;
        int v47 = BYTE1(__s);
        __int16 v48 = 1024;
        int v49 = BYTE2(__s);
        __int16 v50 = 1024;
        int v51 = HIBYTE(__s);
        __int16 v52 = 1024;
        int v53 = v34;
        __int16 v54 = 1024;
        int v55 = HIBYTE(v34);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@Parsed protocol configuration response GSN: %d, C#: %d, advId: %02X:%02X:%02X:%02X:%02X:%02X", buf, 0x3Cu);
      }
      id v24 = v21;
      long long v25 = sub_100083F74();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        long long v26 = sub_100083FD0(v24);
        id v27 = +[NSData dataWithBytes:v56 length:32];
        *(_DWORD *)buf = 138543618;
        long long v41 = v26;
        __int16 v42 = 2112;
        *(void *)long long v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@Broadcast Key: %@", buf, 0x16u);
      }
      if (v19 == 32)
      {
        id v16 = 0;
      }
      else
      {
        long long v28 = +[NSError errorWithOSStatus:v20];
        id v16 = +[NSError hapErrorWithcode:12 description:@"Configuration response failed." reason:@"Failed to parse configuraton response body." suggestion:0 underlyingError:v28];

        if (v16)
        {
          id v29 = v24;
          long long v30 = sub_100083F74();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            long long v31 = sub_100083FD0(v29);
            *(_DWORD *)buf = 138543618;
            long long v41 = v31;
            __int16 v42 = 2112;
            *(void *)long long v43 = v16;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}@Failed parsing protocol configuration response with error: %@", buf, 0x16u);
          }
          if (a6)
          {
            id v16 = v16;
            BOOL v17 = 0;
            *a6 = v16;
          }
          else
          {
            BOOL v17 = 0;
          }
          goto LABEL_36;
        }
      }
      BOOL v17 = 1;
LABEL_36:
      uint64_t v15 = v18;
      goto LABEL_37;
    }
  }
  uint64_t v15 = 0;
LABEL_17:
  id v16 = 0;
  BOOL v17 = 1;
LABEL_37:

  return v17;
}

- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100063AAC;
  v23[3] = &unk_100273CD0;
  objc_copyWeak(&v26, &location);
  char v27 = v6;
  id v10 = v9;
  id v25 = v10;
  id v11 = v8;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = objc_opt_class();
  id v22 = 0;
  if (v6 == 2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  uint64_t v15 = [v13 configurationRequestForService:v11 configRequestType:v14 error:&v22];
  id v16 = v22;
  if (v15)
  {
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v15 shouldPrioritize:0 responseHandler:v12];
  }
  else
  {
    BOOL v17 = self;
    sub_100083F74();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543874;
      long long v30 = v19;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for service, %@, with error: %@", buf, 0x20u);
    }
    uint64_t v20 = +[NSString stringWithFormat:@"Failed to configure service %@.", v11];
    id v21 = +[NSError hapErrorWithcode:1 description:v20 reason:@"Failed to create request." suggestion:0 underlyingError:v16];

    (*((void (**)(id, void, void, void, void *, double))v10 + 2))(v10, 0, 0, 0, v21, 0.0);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  TLV8BufferInit();
  uint64_t v9 = TLV8BufferAppend();
  if (v9 || v7 && (uint64_t v9 = TLV8BufferAppend(), v9))
  {
    uint64_t v10 = v9;
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = +[NSData dataWithBytes:0 length:0];
    if (v12) {
      id v11 = (void *)v12;
    }
    else {
      id v11 = 0;
    }
    if (v12) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 4294960568;
    }
  }
  TLV8BufferFree();
  if (a6 && v10)
  {
    id v13 = +[NSError errorWithOSStatus:v10];
    *a6 = +[NSError hapErrorWithcode:1 description:@"Characteristic configuration failed." reason:@"Failed to create characteristic configuration request body." suggestion:0 underlyingError:v13];
  }
  uint64_t v14 = [[HAPBTLERequest alloc] initWithCharacteristic:v8 requestType:7 bodyData:v11 shouldEncrypt:1 timeoutInterval:10.0];

  return v14;
}

+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 body];
  [v7 bytes];

  id v8 = [v6 body];
  [v8 length];

  uint64_t v22 = 0;
  uint64_t v23 = 0;
  id v21 = 0;
  uint64_t v9 = [v6 request];

  LODWORD(v6) = [v9 type];
  if (v6 != 7)
  {
    id v11 = 0;
    id v12 = 0;
    goto LABEL_16;
  }
  BOOL v10 = 1;
  if (TLV8GetOrCopyCoalesced()
    || (+[NSData dataWithBytes:v23 length:v22],
        (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = 0;
    id v12 = 0;
    goto LABEL_17;
  }
  unsigned __int16 v20 = 0;
  if (TLV8GetOrCopyCoalesced())
  {
    id v11 = v13;
  }
  else
  {
    id v11 = +[NSData dataWithBytes:v23 length:v22];

    if (v11)
    {
      unsigned __int8 v19 = 0;
      id v14 = a1;
      uint64_t v15 = sub_100083F74();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = sub_100083FD0(v14);
        *(_DWORD *)buf = 138543874;
        id v25 = v16;
        __int16 v26 = 1024;
        int v27 = v20;
        __int16 v28 = 1024;
        int v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@Parsed configuration response properties: %0xX, Interval: %d", buf, 0x18u);
      }
    }
  }
  BOOL v17 = +[NSError errorWithOSStatus:4294960591];
  id v12 = +[NSError hapErrorWithcode:12 description:@"Configuration response failed." reason:@"Failed to parse configuraton response body." suggestion:0 underlyingError:v17];

  if (!v12)
  {
LABEL_16:
    BOOL v10 = 1;
    goto LABEL_17;
  }
  if (a4)
  {
    id v12 = v12;
    BOOL v10 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000644E0;
  v15[3] = &unk_100273778;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v27 = a5;
  int v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  id v9 = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v14 = [v13 characteristic];
        unsigned __int8 v15 = [v14 properties];

        if ((v15 & 8) != 0)
        {
          dispatch_group_enter(v9);
          id v20 = [v13 broadcastEnable];
          id v21 = [v13 broadcastInterval];
          uint64_t v22 = [v13 characteristic];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          id v36[2] = sub_100064BC8;
          v36[3] = &unk_100273AA0;
          v36[4] = self;
          id v37 = v29;
          uint64_t v38 = v9;
          [(_HAPAccessoryServerBTLE200 *)self _enableBroadcastEvent:v20 interval:v21 forCharacteristic:v22 completionHandler:v36];
        }
        else
        {
          id v16 = self;
          id v17 = sub_100083F74();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            id v18 = sub_100083FD0(v16);
            unsigned __int8 v19 = [v13 characteristic];
            *(_DWORD *)buf = 138543618;
            __int16 v44 = v18;
            __int16 v45 = 2112;
            __int16 v46 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic %@ does not support broadcast notification", buf, 0x16u);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v10);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v23 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064D40;
  block[3] = &unk_100273D20;
  objc_copyWeak(&v35, (id *)buf);
  id v32 = v28;
  id v33 = v29;
  id v34 = v27;
  id v24 = v29;
  id v25 = v27;
  id v26 = v28;
  dispatch_group_notify(v9, v23, block);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);
}

- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 service];
  id v13 = [v12 accessory];
  id v14 = [v13 server];

  if (v14 == self)
  {
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100065214;
    v29[3] = &unk_100273AF0;
    objc_copyWeak(&v32, &location);
    id v18 = v10;
    id v30 = v18;
    id v19 = v11;
    id v31 = v19;
    id v20 = objc_retainBlock(v29);
    id v28 = 0;
    id v21 = [(id)objc_opt_class() configurationRequestForCharacteristic:v18 isBroadcasted:v8 interval:a4 error:&v28];
    id v22 = v28;
    if (v21)
    {
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v21, 0, v20, &v32);
    }
    else
    {
      uint64_t v23 = self;
      sub_100083F74();
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = sub_100083FD0(v23);
        *(_DWORD *)buf = 138543874;
        id v35 = v25;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v22;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for characteristic, %@, with error: %@", buf, 0x20u);
      }
      id v26 = +[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 9, &v32);
      sub_10005C938(v18, v19, 3, v26, @"Failed to create configuration request.");
    }
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned __int8 v15 = self;
    id v16 = sub_100083F74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = sub_100083FD0(v15);
      *(_DWORD *)buf = 138543618;
      id v35 = v17;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed, characteristic is not part of server: %@", buf, 0x16u);
    }
    sub_10005C938(v10, v11, 3, 0, @"Characteristic is not part of server.");
  }
}

- (void)startPairingWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)HMFActivity);
  id v6 = HMFMethodDescription();
  id v7 = +[NSString stringWithFormat:@"%@, %s:%ld", v6, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 6214];
  id v8 = [v5 initWithName:v7];

  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065670;
  block[3] = &unk_100273418;
  void block[4] = self;
  id v13 = v8;
  id v14 = v4;
  id v10 = v4;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)_checkForAuthPrompt:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100065A84;
  v3[3] = &unk_100273D98;
  v3[4] = self;
  BOOL v4 = a3;
  [(_HAPAccessoryServerBTLE200 *)self _discoverWithType:2 completionHandler:v3];
}

- (void)_getPairingFeaturesWithCompletionHandler:(id)a3
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100066548;
  v19[3] = &unk_100273DC0;
  v19[4] = self;
  id v4 = a3;
  id v20 = v4;
  id v5 = objc_retainBlock(v19);
  id v6 = [(_HAPAccessoryServerBTLE200 *)self pairingFeaturesCharacteristic];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 value];

    if (!v8)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100066788;
      v16[3] = &unk_100273DE8;
      v16[4] = self;
      id v18 = v5;
      id v13 = v7;
      id v17 = v13;
      id v14 = objc_retainBlock(v16);
      [(_HAPAccessoryServerBTLE200 *)self _readValueForCharacteristic:v13 options:2 completionHandler:v14];

      goto LABEL_9;
    }
    *(void *)buf = 0;
    id v15 = 0;
    [(_HAPAccessoryServerBTLE200 *)self _parsePairingFeaturesCharacteristic:v7 authMethod:buf error:&v15];
    id v9 = v15;
    ((void (*)(void *, void, id))v5[2])(v5, *(void *)buf, v9);
  }
  else
  {
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_100083FD0(v10);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pairing Features characteristic", buf, 0xCu);
    }
    id v9 = +[NSError hapErrorWithcode:7 description:@"Pairing Failed." reason:@"Missing Pairing Features characteristic." suggestion:0 underlyingError:0];
    ((void (*)(void *, void, id))v5[2])(v5, 0, v9);
  }

LABEL_9:
}

- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5
{
  id v8 = [a3 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    -[_HAPAccessoryServerBTLE200 setFeatureFlags:](self, "setFeatureFlags:", [v8 unsignedCharValue]);
    [(HAPAccessoryServer *)self setAuthMethod:sub_100022E68([(_HAPAccessoryServerBTLE200 *)self featureFlags])];
    if ((id)[(HAPAccessoryServer *)self authMethod] == (id)6) {
      [(HAPAccessoryServer *)self setAuthMethod:4];
    }
    if (a4) {
      *a4 = [(HAPAccessoryServer *)self authMethod];
    }
  }
  else
  {
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_100083FD0(v10);
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the Pairing Features characteristic value is invalid", (uint8_t *)&v14, 0xCu);
    }
    if (a5)
    {
      *a5 = +[NSError hapErrorWithcode:12 description:@"Pairing Failed." reason:@"The Pairing Features characteristic value is missing" suggestion:0 underlyingError:0];
    }
  }

  return isKindOfClass & 1;
}

- (void)continuePairingAfterAuthPrompt
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066B20;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  id v4 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066FB4;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)_handlePairSetupSessionExchangeData:(id)a3
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006739C;
  v15[3] = &unk_100273E10;
  id v4 = a3;
  id v16 = v4;
  id v17 = self;
  id v5 = objc_retainBlock(v15);
  id v6 = [(_HAPAccessoryServerBTLE200 *)self pairSetupCharacteristic];
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000675CC;
    v12[3] = &unk_100273DE8;
    v12[4] = self;
    int v14 = v5;
    id v13 = v6;
    [(_HAPAccessoryServerBTLE200 *)self _writeValue:v4 toCharacteristic:v13 authorizationData:0 contextData:0 options:26 completionHandler:v12];
  }
  else
  {
    id v7 = self;
    id v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pair Setup characteristic", buf, 0xCu);
    }
    id v10 = +[NSError hapErrorWithcode:7 description:@"Pairing Failed." reason:@"Missing Pair Setup characteristic." suggestion:0 underlyingError:0];
    ((void (*)(void *, void *))v5[2])(v5, v10);
    id v11 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
    [v11 receivedSetupExchangeData:0 error:v10];
  }
}

- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isBadSetupCode]
    && [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:"])
  {
    [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
    [(_HAPAccessoryServerBTLE200 *)self setSetupCodeCompletionHandler:v4];
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    id v6 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100067A50;
    v12[3] = &unk_100273018;
    v12[4] = self;
    id v7 = v12;
LABEL_6:
    dispatch_async(v5, v7);
    goto LABEL_10;
  }
  if ([(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServer:promptUserForPasswordWithType:"])
  {
    [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
    [(_HAPAccessoryServerBTLE200 *)self setSetupCodeCompletionHandler:v4];
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    id v6 = v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100067AB8;
    v11[3] = &unk_100273018;
    v11[4] = self;
    id v7 = v11;
    goto LABEL_6;
  }
  id v8 = self;
  id v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = sub_100083FD0(v8);
    *(_DWORD *)buf = 138543362;
    int v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@The delegate does not support prompting the user for a passcode", buf, 0xCu);
  }
  id v6 = +[NSError hapErrorWithcode:9 description:@"Pairing Failed." reason:@"The delegate is missing." suggestion:0 underlyingError:0];
  v4[2](v4, 0, v6);
  [(_HAPAccessoryServerBTLE200 *)v8 setSetupCodeCompletionHandler:0];
LABEL_10:
}

- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100067BC8;
  v9[3] = &unk_100273040;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (void)_pairingCompletedWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Pair Setup completed with error: %@", buf, 0x16u);
  }
  if (v4)
  {
    [(_HAPAccessoryServerBTLE200 *)v5 setPairing:0];
    [(_HAPAccessoryServerBTLE200 *)v5 setPairingDisconnectionError:0];
    [(_HAPAccessoryServerBTLE200 *)v5 setBadPairSetupCode:0];
    [(_HAPAccessoryServerBTLE200 *)v5 setPairSetupBackoffTimeInterval:0.0];
    [(_HAPAccessoryServerBTLE200 *)v5 setPairSetupSession:0];
    [(_HAPAccessoryServerBTLE200 *)v5 disconnectWithCompletionHandler:0 disconnectionError:v4];
  }
  [(_HAPAccessoryServerBTLE200 *)v5 setWaitingForAuth:0];
  id v8 = [(_HAPAccessoryServerBTLE200 *)v5 _getPairSetupType];
  if (v8 == (id)5)
  {
    if ([(_HAPAccessoryServerBTLE200 *)v5 _delegateRespondsToSelector:"accessoryServer:validateCert:model:"])
    {
      id v15 = [(_HAPAccessoryServerBTLE200 *)v5 pairSetupSession];
      id v16 = [v15 getCertificate];

      id v17 = [(HAPAccessoryServer *)v5 delegateQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100068294;
      v19[3] = &unk_100273040;
      v19[4] = v5;
      id v20 = v16;
      id v18 = v16;
      dispatch_async(v17, v19);
    }
  }
  else if (v8 == (id)3)
  {
    id v9 = [(_HAPAccessoryServerBTLE200 *)v5 pairSetupSession];
    [v9 generateSessionKeys];

    id v10 = [HAPAuthSession alloc];
    id v11 = [(_HAPAccessoryServerBTLE200 *)v5 protocolInfoServiceSignatureCharacteristics];
    id v12 = [v11 instanceID];
    id v13 = [(HAPAuthSession *)v10 initWithRole:0 instanceId:v12 delegate:v5];
    [(_HAPAccessoryServerBTLE200 *)v5 setAuthSession:v13];

    +[NSDate date];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100067FD4;
    v21[3] = &unk_100273E10;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v5;
    id v14 = v22;
    [(_HAPAccessoryServerBTLE200 *)v5 getAccessoryInfo:v21];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v5 setPairing:0];
    [(_HAPAccessoryServerBTLE200 *)v5 setBadPairSetupCode:0];
    [(_HAPAccessoryServerBTLE200 *)v5 setPairSetupBackoffTimeInterval:0.0];
    [(_HAPAccessoryServerBTLE200 *)v5 setPairSetupSession:0];
    [(HAPAccessoryServer *)v5 setPairingRequest:0];
    [(_HAPAccessoryServerBTLE200 *)v5 _notifyDelegatesPairingStopped:v4];
  }
}

- (HAPCharacteristic)pairingFeaturesCharacteristic
{
  p_authenticatedProtocolInfo = &self->_authenticatedProtocolInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticatedProtocolInfo);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000010-0000-1000-8000-4D69736D6574"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000013-0000-1000-8000-4D69736D6574"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_authenticatedProtocolInfo, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_authenticatedProtocolInfo);

  return (HAPCharacteristic *)v10;
}

- (HAPCharacteristic)pairSetupCharacteristic
{
  p_pairingFeaturesCharacteristic = &self->_pairingFeaturesCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingFeaturesCharacteristic);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000010-0000-1000-8000-4D69736D6574"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000011-0000-1000-8000-4D69736D6574"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairingFeaturesCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairingFeaturesCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (HAPCharacteristic)pairingsCharacteristic
{
  p_pairVerifyOperationQueue = &self->_pairVerifyOperationQueue;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairVerifyOperationQueue);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000010-0000-1000-8000-4D69736D6574"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000014-0000-1000-8000-4D69736D6574"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairVerifyOperationQueue, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairVerifyOperationQueue);

  return (HAPCharacteristic *)v10;
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000686B8;
  v15[3] = &unk_100273778;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100068EC0;
  v15[3] = &unk_100273778;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  return [(_HAPAccessoryServerBTLE200 *)self removePairingForCurrentControllerOnQueue:a3 completion:a4 serverPairingCompletion:0];
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self keyStore];
  id v12 = [(HAPAccessoryServer *)self identifier];
  id v30 = 0;
  id v13 = [v11 readControllerPairingKeyForAccessory:v12 error:&v30];
  id v14 = v30;

  id v15 = self;
  id v16 = sub_100083F74();
  id v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v18 = sub_100083FD0(v15);
      *(_DWORD *)buf = 138543362;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Received request to remove pairing for the current controller", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v15);
    id v19 = [(HAPAccessoryServer *)v15 clientQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100069980;
    v22[3] = &unk_100273E88;
    objc_copyWeak(&v26, (id *)buf);
    uint64_t v23 = v8;
    id v24 = v9;
    id v25 = v10;
    [(_HAPAccessoryServerBTLE200 *)v15 removePairing:v13 completionQueue:v19 completionHandler:v22];

    [(_HAPAccessoryServerBTLE200 *)v15 setHasValidCache:0];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = sub_100083FD0(v15);
      *(_DWORD *)buf = 138543618;
      id v32 = v20;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Remove current pairing failed, failed to get the current controller with error: %@", buf, 0x16u);
    }
    if (v8 && v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006996C;
      block[3] = &unk_1002733F0;
      id v29 = v9;
      id v28 = v14;
      dispatch_async(v8, block);
    }
  }

  return v13 != 0;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069F1C;
  block[3] = &unk_100273108;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self pairingsCharacteristic];
  if (v8)
  {
    objc_initWeak(location, self);
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10006A768;
    id v17 = &unk_100273ED8;
    objc_copyWeak(&v19, location);
    id v18 = v7;
    id v9 = objc_retainBlock(&v14);
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v6, v8, 0, 0, 7, v9, v14, v15, v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_100083FD0(v10);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, missing the Pairings characteristic", (uint8_t *)location, 0xCu);
    }
    if (v7)
    {
      id v13 = +[NSError hapErrorWithcode:12 description:@"Pairing operation failed." reason:@"Missing Pairings characteristic." suggestion:0 underlyingError:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    }
  }
}

- (id)getLocalPairingIdentityWithError:(id *)a3
{
  id v5 = [(HAPAccessoryServer *)self keyStore];
  id v6 = [(HAPAccessoryServer *)self identifier];
  id v7 = [v5 readControllerPairingKeyForAccessory:v6 error:a3];

  return v7;
}

- (unint64_t)_getPairSetupType
{
  unint64_t result = [(HAPAccessoryServer *)self authMethod];
  if (result != 1)
  {
    if ((id)[(HAPAccessoryServer *)self authMethod] == (id)2)
    {
      if ([(_HAPAccessoryServerBTLE200 *)self authenticated]) {
        return 4;
      }
      else {
        return 3;
      }
    }
    else if ((id)[(HAPAccessoryServer *)self authMethod] == (id)4)
    {
      return 5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006ABB4;
  v6[3] = &unk_1002738F8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_HAPAccessoryServerBTLE200 *)self _discoverWithType:1 completionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (HAPCharacteristic)identifyCharacteristic
{
  p_discoveryRetries = &self->_discoveryRetries;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryRetries);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"0000003E-0000-1000-8000-4D69736D6574"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000014-0000-1000-8000-4D69736D6574"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_discoveryRetries, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_discoveryRetries);

  return (HAPCharacteristic *)v10;
}

- (id)_pendingRequestForCharacteristic:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 characteristic];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pendingResponseForRequest:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self pendingResponses];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 request];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(_HAPAccessoryServerBTLE200 *)self connectionState];
  if (v10 != 3 && v10)
  {
    unsigned __int8 v11 = (_HAPAccessoryServerBTLE200 *)objc_alloc_init((Class)HMFBlockOperation);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v11);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006B748;
    v21[3] = &unk_100273F50;
    objc_copyWeak(&v23, &location);
    void v21[4] = self;
    id v14 = v8;
    id v22 = v14;
    objc_copyWeak(&v24, (id *)buf);
    [(_HAPAccessoryServerBTLE200 *)v11 addExecutionBlock:v21];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006B928;
    v16[3] = &unk_100273F78;
    objc_copyWeak(&v19, (id *)buf);
    objc_copyWeak(&v20, &location);
    id v15 = v14;
    id v17 = v15;
    id v18 = v9;
    [(_HAPAccessoryServerBTLE200 *)v11 setCompletionBlock:v16];
    [v15 setOperation:v11];
    [(_HAPAccessoryServerBTLE200 *)self _enqueueRequest:v15 shouldPrioritize:v6];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    unsigned __int8 v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543362;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Skipping request, accessory has disconnected or is about to disconnect", buf, 0xCu);
    }
  }
}

- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006BDE8;
  block[3] = &unk_100273108;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBTLE *)self peripheral];
  unint64_t v6 = (unint64_t)[v5 maximumWriteValueLengthForType:0];

  id v7 = [(HAPAccessoryServerBTLE *)self peripheral];
  unint64_t v8 = (unint64_t)[v7 maximumWriteValueLengthForType:1];

  if (!v6)
  {
    id v9 = self;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v11 = sub_100083FD0(v9);
      int v24 = 138543362;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the maximum write length to 512", (uint8_t *)&v24, 0xCu);
    }
    unint64_t v6 = 512;
    if (!v8) {
      goto LABEL_8;
    }
LABEL_7:
    if (v8 != -3) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  id v12 = self;
  id v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = sub_100083FD0(v12);
    int v24 = 138543362;
    id v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the peripheral's mtu length to 23", (uint8_t *)&v24, 0xCu);
  }
  unint64_t v8 = 23;
LABEL_11:
  unsigned int v15 = [v4 isEncrypted];
  unint64_t v16 = 25;
  if (!v15) {
    unint64_t v16 = 1;
  }
  if (v8 / v16 >= 4)
  {
    id v17 = self;
    id v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = sub_100083FD0(v17);
      int v24 = 138543618;
      id v25 = v19;
      __int16 v26 = 2048;
      unint64_t v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Electing to write as reduced size payload of length %tu", (uint8_t *)&v24, 0x16u);
    }
    unint64_t v6 = v8;
  }
  if ([v4 isEncrypted])
  {
    if (v6 > 0x17)
    {
      v6 -= 24;
    }
    else
    {
      id v20 = self;
      id v21 = sub_100083F74();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = sub_100083FD0(v20);
        int v24 = 138543874;
        id v25 = v22;
        __int16 v26 = 2048;
        unint64_t v27 = v6;
        __int16 v28 = 1024;
        int v29 = 24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@The maximum write length, %tu, is less than the nonce and auth tag length, %d", (uint8_t *)&v24, 0x1Cu);
      }
      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C684;
  block[3] = &unk_100273418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v15 = 0;
  id v10 = [(_HAPAccessoryServerBTLE200 *)self _encryptDataAndGenerateAuthTag:a3 error:&v15];
  id v11 = v15;
  if (v10)
  {
    [(_HAPAccessoryServerBTLE200 *)self _sendData:v10 toCharacteristic:v8 completionHandler:v9];
  }
  else
  {
    id v12 = self;
    id v13 = sub_100083F74();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = sub_100083FD0(v12);
      *(_DWORD *)buf = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt raw write payload with error: %@", buf, 0x16u);
    }
    if (v9) {
      v9[2](v9, v11);
    }
  }
}

- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = [a3 serialize];
  if (![v8 isEncrypted])
  {
    id v12 = 0;
    goto LABEL_5;
  }
  id v24 = 0;
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self _encryptDataAndGenerateAuthTag:v10 error:&v24];
  id v12 = v24;

  if (v11)
  {
    id v10 = (void *)v11;
LABEL_5:
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = sub_100083FD0(v13);
      id v16 = [v10 length];
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v15;
      __int16 v27 = 2048;
      id v28 = v16;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@Sending %tu bytes of control payload for request: %@", buf, 0x20u);
    }
    id v17 = v13;
    __int16 v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v19;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Sending control payload for request, %@, to accessory: %@", buf, 0x20u);
    }
    id v20 = [v8 characteristic];
    [(_HAPAccessoryServerBTLE200 *)v17 _sendData:v10 toCharacteristic:v20 completionHandler:v9];

    goto LABEL_10;
  }
  id v21 = self;
  id v22 = sub_100083F74();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = sub_100083FD0(v21);
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v23;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt control payload with error: %@", buf, 0x16u);
  }
  if (v9) {
    v9[2](v9, v12);
  }
LABEL_10:
}

- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    id v16 = [v9 cbCharacteristic];
    if (v16)
    {
      id v17 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
      id v18 = [v10 copy];
      id v19 = objc_retainBlock(v18);
      [v17 setObject:v19 forKey:v9];

      id v20 = [(HAPAccessoryServerBTLE *)self peripheral];
      [v20 writeValue:v8 forCharacteristic:v16 type:0];

      [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    }
    else
    {
      id v21 = self;
      id v22 = sub_100083F74();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = sub_100083FD0(v21);
        int v25 = 138543618;
        __int16 v26 = v23;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v25, 0x16u);
      }
      if (v10)
      {
        id v24 = +[NSError hapErrorWithcode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
        (*((void (**)(id, void *))v10 + 2))(v10, v24);
      }
    }
    goto LABEL_12;
  }
  id v13 = self;
  id v14 = sub_100083F74();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = sub_100083FD0(v13);
    int v25 = 138543618;
    __int16 v26 = v15;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@A write operation for '%@' is already is progress.", (uint8_t *)&v25, 0x16u);
  }
  if (v10)
  {
    id v16 = +[NSError hapErrorWithcode:4 description:@"Operation in progress." reason:@"A write operation is already in progress." suggestion:0 underlyingError:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
LABEL_12:
  }
}

- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
    [v10 removeObjectForKey:v6];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    ((void (**)(void, id))v9)[2](v9, v7);
  }
  else
  {
    uint64_t v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = sub_100083FD0(v11);
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected write completion from characteristic, %@, dropping", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_requestResponseForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 characteristic];
  id v6 = [v5 cbCharacteristic];

  if (v6)
  {
    id v7 = [v4 responseTimer];
    [v7 resume];

    id v8 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v8 readValueForCharacteristic:v6];
  }
  else
  {
    id v9 = self;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = sub_100083FD0(v9);
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for request: %@", (uint8_t *)&v12, 0x16u);
    }
    id v8 = +[NSError hapErrorWithcode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
    [v4 cancelWithError:v8];
  }
}

- (void)_handleRawResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v60 = 0;
    uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self _decryptData:v8 error:&v60];
    int v12 = v60;
    id v13 = self;
    __int16 v14 = sub_100083F74();
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        sub_100083FD0(v13);
        __int16 v16 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v62 = v16;
        __int16 v63 = 2112;
        id v64 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);
      }
      if (!v9) {
        goto LABEL_24;
      }
      id v17 = [v9 cbCharacteristic];

      if (!v17) {
        goto LABEL_24;
      }
      id v18 = [v9 cbCharacteristic];
      id v19 = [v18 UUID];
      id v20 = +[CBUUID UUIDWithString:@"00000104-0000-1000-8000-4D69736D6574"];
      if ([v19 isEqual:v20]) {
        goto LABEL_14;
      }
      int v55 = v19;
      id v56 = v18;
      id v21 = [v9 cbCharacteristic];
      id v22 = [v21 UUID];
      id v23 = +[CBUUID UUIDWithString:@"00000105-0000-1000-8000-4D69736D6574"];
      if ([v22 isEqual:v23])
      {
LABEL_13:

        id v19 = v55;
        id v18 = v56;
LABEL_14:

        goto LABEL_15;
      }
      int v53 = v22;
      __int16 v54 = v20;
      __int16 v52 = v23;
      id v24 = [v9 cbCharacteristic];
      int v25 = [v24 UUID];
      __int16 v26 = +[CBUUID UUIDWithString:@"00000108-0000-1000-8000-4D69736D6574"];
      if ([v25 isEqual:v26])
      {

        id v23 = v52;
        id v22 = v53;
        id v20 = v54;
        goto LABEL_13;
      }
      int v49 = v26;
      __int16 v50 = v25;
      int v51 = v24;
      __int16 v48 = [v9 cbCharacteristic];
      uint64_t v35 = [v48 UUID];
      uint64_t v36 = +[CBUUID UUIDWithString:@"00000110-0000-1000-8000-4D69736D6574"];
      int v47 = (void *)v35;
      id v37 = (void *)v35;
      __int16 v38 = (void *)v36;
      if ([v37 isEqual:v36])
      {
        unsigned __int8 v39 = 1;
      }
      else
      {
        __int16 v46 = [v9 cbCharacteristic];
        long long v40 = [v46 UUID];
        __int16 v44 = +[CBUUID UUIDWithString:@"00000109-0000-1000-8000-4D69736D6574"];
        __int16 v45 = v40;
        if (objc_msgSend(v40, "isEqual:"))
        {
          unsigned __int8 v39 = 1;
        }
        else
        {
          long long v43 = [v9 cbCharacteristic];
          long long v42 = [v43 UUID];
          long long v41 = +[CBUUID UUIDWithString:@"0000010A-0000-1000-8000-4D69736D6574"];
          unsigned __int8 v39 = [v42 isEqual:v41];
        }
      }

      if (v39)
      {
LABEL_15:
        __int16 v27 = v13;
        id v28 = sub_100083F74();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          sub_100083FD0(v27);
          __int16 v29 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          id v62 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}@RAW notify received!", buf, 0xCu);
        }
        if ([(_HAPAccessoryServerBTLE200 *)v27 _delegateRespondsToSelector:"accessoryServer:didUpdateValuesForCharacteristic:value:"])
        {
          id v30 = [(HAPAccessoryServer *)v27 delegateQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10006D8B4;
          block[3] = &unk_100273418;
          void block[4] = v27;
          id v58 = v9;
          uint64_t v11 = v11;
          uint64_t v59 = v11;
          dispatch_async(v30, block);
        }
        goto LABEL_24;
      }
      id v13 = v13;
      id v15 = sub_100083F74();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        sub_100083FD0(v13);
        id v31 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        id v62 = v31;
        id v32 = "%{public}@RAW read data not allowed on this characteristic!";
        __int16 v33 = v15;
        uint32_t v34 = 12;
        goto LABEL_21;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_100083FD0(v13);
      id v31 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v62 = v31;
      __int16 v63 = 2112;
      id v64 = v12;
      id v32 = "%{public}@Failed to decrypt read data with error: %@";
      __int16 v33 = v15;
      uint32_t v34 = 22;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    }
    goto LABEL_23;
  }
  uint64_t v11 = self;
  int v12 = sub_100083F74();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100083FD0(v11);
    id v13 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v62 = v13;
    __int16 v63 = 2112;
    id v64 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get read data with error: %@", buf, 0x16u);
LABEL_23:
  }
LABEL_24:
}

- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = (_HAPAccessoryServerBTLE200 *)a4;
  id v10 = a5;
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self _pendingRequestForCharacteristic:v9];
  int v12 = v11;
  if (!v11)
  {
    __int16 v16 = self;
    id v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = sub_100083FD0(v16);
      *(_DWORD *)buf = 138543618;
      id v81 = v18;
      __int16 v82 = 2112;
      __int16 v83 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected response from characteristic, %@, dropping", buf, 0x16u);
    }
    goto LABEL_64;
  }
  if (!v10)
  {
    id v19 = [(_HAPAccessoryServerBTLE200 *)v11 responseTimer];
    [v19 suspend];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    id v20 = (_HAPAccessoryServerBTLE200 *)v8;
    if ([(_HAPAccessoryServerBTLE200 *)v12 isEncrypted])
    {
      id v79 = 0;
      uint64_t v21 = [(_HAPAccessoryServerBTLE200 *)self _decryptData:v20 error:&v79];
      __int16 v16 = (_HAPAccessoryServerBTLE200 *)v79;

      if (!v21)
      {
        long long v43 = self;
        __int16 v44 = sub_100083F74();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          __int16 v45 = sub_100083FD0(v43);
          *(_DWORD *)buf = 138543874;
          id v81 = v45;
          __int16 v82 = 2112;
          __int16 v83 = v12;
          __int16 v84 = 2112;
          uint64_t v85 = (uint64_t)v16;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt response to request %@ with error: %@", buf, 0x20u);
        }
        [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v16];
        goto LABEL_64;
      }

      __int16 v16 = (_HAPAccessoryServerBTLE200 *)v21;
    }
    else
    {
      __int16 v16 = v20;
    }
    id v22 = self;
    id v23 = sub_100083F74();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = sub_100083FD0(v22);
      *(_DWORD *)buf = 138543618;
      id v81 = v24;
      __int16 v82 = 2112;
      __int16 v83 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);
    }
    id v78 = 0;
    int v25 = +[HAPBTLEControlPacket packetWithSerializedData:v16 error:&v78];
    __int16 v26 = (_HAPAccessoryServerBTLE200 *)v78;
    if (!v25)
    {
      uint64_t v36 = v22;
      id v37 = sub_100083F74();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = sub_100083FD0(v36);
        *(_DWORD *)buf = 138543618;
        id v81 = v38;
        __int16 v82 = 2112;
        __int16 v83 = v26;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse control field with error: %@", buf, 0x16u);
      }
      [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v26];
      goto LABEL_63;
    }
    if ([v25 type] != 1)
    {
      unsigned __int8 v39 = v22;
      long long v40 = sub_100083F74();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        long long v41 = sub_100083FD0(v39);
        unsigned int v42 = [v25 type];
        *(_DWORD *)buf = 138543618;
        id v81 = v41;
        __int16 v82 = 1024;
        LODWORD(v83) = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@Invalid response type control type: %u", buf, 0x12u);
      }
      uint64_t v35 = +[NSError hapErrorWithcode:3 description:@"Request failed." reason:@"Invalid response control type." suggestion:0 underlyingError:0];
      [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v35];
      goto LABEL_62;
    }
    long long v76 = v26;
    if ([v25 isContinuationPacket])
    {
      __int16 v27 = [(HAPAccessoryServer *)v12 identifier];
      id v28 = [v25 transactionIdentifier];
      unsigned __int8 v29 = [v27 isEqual:v28];

      if ((v29 & 1) == 0)
      {
        int v55 = v22;
        id v56 = sub_100083F74();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          long long v75 = sub_100083FD0(v55);
          id v57 = [v25 transactionIdentifier];
          uint64_t v58 = [(HAPAccessoryServer *)v12 identifier];
          *(_DWORD *)buf = 138543874;
          id v81 = v75;
          __int16 v82 = 2112;
          __int16 v83 = v57;
          __int16 v84 = 2112;
          uint64_t v85 = v58;
          uint64_t v59 = (void *)v58;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}@The continuation response payload transaction identifier, %@, does not match the request's transaction identifier, %@.", buf, 0x20u);
        }
        [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:0];
        __int16 v26 = v76;
        goto LABEL_63;
      }
    }
    if ([v25 isContinuationPacket])
    {
      uint64_t v30 = [(_HAPAccessoryServerBTLE200 *)v22 _pendingResponseForRequest:v12];
      id v31 = v22;
      id v32 = sub_100083F74();
      __int16 v33 = v32;
      long long v73 = (HAPBTLEResponse *)v30;
      if (!v30)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = sub_100083FD0(v31);
          *(_DWORD *)buf = 138543618;
          id v81 = v69;
          __int16 v82 = 2112;
          __int16 v83 = v12;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve the response for the continued request: %@", buf, 0x16u);
        }
        uint64_t v35 = +[NSError hapErrorWithcode:3 description:@"Request failed." reason:@"Failed to handle continued response." suggestion:0 underlyingError:0];
        [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v35];
        __int16 v26 = v76;
        goto LABEL_62;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint32_t v34 = sub_100083FD0(v31);
        *(_DWORD *)buf = 138543618;
        id v81 = v34;
        __int16 v82 = 2112;
        __int16 v83 = (_HAPAccessoryServerBTLE200 *)v73;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}@Received data for continued response: %@", buf, 0x16u);
      }
      uint64_t v35 = v73;
    }
    else
    {
      uint64_t v35 = [[HAPBTLEResponse alloc] initWithRequest:v12];
      __int16 v46 = [(_HAPAccessoryServerBTLE200 *)v22 pendingResponses];
      [v46 addObject:v35];

      id v31 = (_HAPAccessoryServerBTLE200 *)[objc_alloc((Class)HMFTimer) initWithTimeInterval:1 options:4.0];
      [(_HAPAccessoryServerBTLE200 *)v31 setDelegate:v22];
      int v47 = [(HAPAccessoryServer *)v22 clientQueue];
      [(_HAPAccessoryServerBTLE200 *)v31 setDelegateQueue:v47];

      [(_HAPAccessoryServerBTLE200 *)v12 setResponseTimer:v31];
    }

    __int16 v48 = [v25 payload];
    id v77 = 0;
    unint64_t v49 = [(HAPBTLEResponse *)v35 appendData:v48 error:&v77];
    id v74 = v77;

    if (v49)
    {
      if (![(HAPBTLEResponse *)v35 isComplete])
      {
        __int16 v50 = v35;
        long long v66 = v22;
        long long v67 = sub_100083F74();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          id v68 = sub_100083FD0(v66);
          *(_DWORD *)buf = 138543618;
          id v81 = v68;
          __int16 v82 = 2112;
          __int16 v83 = (_HAPAccessoryServerBTLE200 *)v50;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}@Requesting additional data for response: %@", buf, 0x16u);
        }
        [(_HAPAccessoryServerBTLE200 *)v66 _requestResponseForRequest:v12];
        goto LABEL_60;
      }
      __int16 v26 = v76;
      if ([(HAPBTLEResponse *)v35 isValid])
      {
        if ([(_HAPAccessoryServerBTLE200 *)v12 isFinished])
        {
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
          goto LABEL_65;
        }
        __int16 v50 = v35;
        int v51 = v22;
        __int16 v52 = sub_100083F74();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          int v53 = sub_100083FD0(v51);
          *(_DWORD *)buf = 138543618;
          id v81 = v53;
          __int16 v82 = 2112;
          __int16 v83 = (_HAPAccessoryServerBTLE200 *)v50;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%{public}@Handling completed response: %@", buf, 0x16u);
        }
        if ([(_HAPAccessoryServerBTLE200 *)v12 type] == 4) {
          [(_HAPAccessoryServerBTLE200 *)v51 _suspendAllOperations];
        }
        __int16 v54 = [(_HAPAccessoryServerBTLE200 *)v12 operation];
        [v54 finish];
        goto LABEL_59;
      }
      __int16 v50 = v35;
      uint64_t v70 = v22;
      id v71 = sub_100083F74();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        id v72 = sub_100083FD0(v70);
        *(_DWORD *)buf = 138543874;
        id v81 = v72;
        __int16 v82 = 2112;
        __int16 v83 = (_HAPAccessoryServerBTLE200 *)v50;
        __int16 v84 = 2112;
        uint64_t v85 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response, %@, to request: %@", buf, 0x20u);
      }
      CFStringRef v63 = @"Invalid response.";
      CFStringRef v64 = @"The response could not be validated against the reuqest.";
      id v65 = 0;
    }
    else
    {
      __int16 v50 = v35;
      id v60 = v22;
      v61 = sub_100083F74();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        id v62 = sub_100083FD0(v60);
        *(_DWORD *)buf = 138543618;
        id v81 = v62;
        __int16 v82 = 2112;
        __int16 v83 = (_HAPAccessoryServerBTLE200 *)v50;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize the response data for response: %@", buf, 0x16u);
      }
      CFStringRef v63 = @"Failed to deserialize response.";
      CFStringRef v64 = 0;
      id v65 = v74;
    }
    __int16 v54 = +[NSError hapErrorWithcode:15 description:v63 reason:v64 suggestion:0 underlyingError:v65];
    [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v54];
LABEL_59:

LABEL_60:
    __int16 v26 = v76;
    uint64_t v35 = v50;
    goto LABEL_61;
  }
  id v13 = self;
  __int16 v14 = sub_100083F74();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = sub_100083FD0(v13);
    *(_DWORD *)buf = 138543874;
    id v81 = v15;
    __int16 v82 = 2112;
    __int16 v83 = v12;
    __int16 v84 = 2112;
    uint64_t v85 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response for request, %@, with error: %@", buf, 0x20u);
  }
  [(_HAPAccessoryServerBTLE200 *)v12 cancelWithError:v10];
LABEL_65:
}

- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] >= 2)
  {
    uint64_t v8 = [v6 subdataWithRange:1, [v6 length] - 1];

    id v6 = (id)v8;
  }
  id v9 = self;
  id v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = sub_100083FD0(v9);
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Sending Protocol Exchange for data: %@", buf, 0x16u);
  }
  int v12 = [(_HAPAccessoryServerBTLE200 *)v9 protocolInfoServiceSignatureCharacteristics];
  if (v12)
  {
    objc_initWeak(&location, v9);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006E7F0;
    v24[3] = &unk_100273FC8;
    objc_copyWeak(&v26, &location);
    id v13 = v7;
    id v25 = v13;
    __int16 v14 = objc_retainBlock(v24);
    id v15 = [[HAPBTLERequest alloc] initWithCharacteristic:v12 requestType:255 bodyData:v6 shouldEncrypt:1 timeoutInterval:10.0];
    if (v15)
    {
      [(_HAPAccessoryServerBTLE200 *)v9 _sendRequest:v15 shouldPrioritize:0 responseHandler:v14];
      [(_HAPAccessoryServerBTLE200 *)v9 _kickConnectionIdleTimer];
    }
    else
    {
      id v20 = v9;
      sub_100083F74();
      uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = sub_100083FD0(v20);
        *(_DWORD *)buf = 138543618;
        unsigned __int8 v29 = v22;
        __int16 v30 = 2112;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create exchange request for characteristic, %@", buf, 0x16u);
      }
      id v23 = +[NSError hapErrorWithcode:9];
      (*((void (**)(id, void *, void))v13 + 2))(v13, v23, 0);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v16 = v9;
    id v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = sub_100083FD0(v16);
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed, missing the Service Signature Characteristic for Protocol Info Service", buf, 0xCu);
    }
    id v19 = +[NSError errorWithDomain:@"HAPErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v19, 0);
  }
}

- (void)tryEstablishSecuritySession
{
  [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
  [(HAPAccessoryServerBTLE *)self enterTrackingMode];
  id v6 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  if ([v6 isOpen])
  {
LABEL_4:

    return;
  }
  id v3 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  if ([v3 isOpening])
  {

    goto LABEL_4;
  }
  id v4 = [(_HAPAccessoryServerBTLE200 *)self pairSetupSession];
  unsigned __int8 v5 = [v4 isSecureSession];

  if ((v5 & 1) == 0)
  {
    [(_HAPAccessoryServerBTLE200 *)self _suspendAllOperations];
    [(HAPAccessoryServer *)self setMetric_pairVerifyReason:@"noSession.tracking"];
    [(_HAPAccessoryServerBTLE200 *)self _establishSecureSession];
  }
}

- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = sub_100083FD0(v7);
    int v21 = 138543618;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Queueing request: %@", (uint8_t *)&v21, 0x16u);
  }
  id v10 = [v6 characteristic];
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)v7 pairVerifyCharacteristic];
  if ([v10 isEqual:v11])
  {
    unsigned int v12 = [v6 type];

    if (v12 != 1)
    {
      uint64_t v13 = [(_HAPAccessoryServerBTLE200 *)v7 pairVerifyOperationQueue];
      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([v6 isEncrypted])
  {
    __int16 v14 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];
    if (![v14 isOpen])
    {
      id v15 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];
      if (![v15 isOpening])
      {
        id v19 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
        unsigned __int8 v20 = [v19 isSecureSession];

        if ((v20 & 1) == 0)
        {
          [(_HAPAccessoryServerBTLE200 *)v7 _suspendAllOperations];
          [(HAPAccessoryServer *)v7 setMetric_pairVerifyReason:@"noSession.request"];
          [(_HAPAccessoryServerBTLE200 *)v7 _establishSecureSession];
        }
        goto LABEL_12;
      }
    }
  }
LABEL_12:
  uint64_t v13 = [(_HAPAccessoryServerBTLE200 *)v7 requestOperationQueue];
LABEL_13:
  __int16 v16 = (void *)v13;
  if (v4)
  {
    id v17 = [v6 operation];
    [v17 setQueuePriority:4];
  }
  id v18 = [v6 operation];
  [v16 addOperation:v18];
}

- (unint64_t)_outstandingRequests
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  id v3 = [v2 operations];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) isFinished] ^ 1;
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)_suspendAllOperations
{
  id v3 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  unsigned __int8 v4 = [v3 isSuspended];

  if ((v4 & 1) == 0)
  {
    id v5 = self;
    unint64_t v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = sub_100083FD0(v5);
      int v9 = 138543362;
      long long v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Suspending all request operations", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)v5 requestOperationQueue];
    [v8 setSuspended:1];
  }
}

- (void)_resumeAllOperations
{
  id v3 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  unsigned int v4 = [v3 isSuspended];

  if (v4)
  {
    id v5 = self;
    unint64_t v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = sub_100083FD0(v5);
      int v9 = 138543362;
      long long v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Resuming all request operations", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)v5 requestOperationQueue];
    [v8 setSuspended:0];
  }
}

- (void)_cancelAllQueuedOperationsWithError:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
    unint64_t v6 = [v5 operations];
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = self;
      int v9 = sub_100083F74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        long long v10 = sub_100083FD0(v8);
        long long v11 = [(_HAPAccessoryServerBTLE200 *)v8 requestOperationQueue];
        long long v12 = [v11 operations];
        int v14 = 138543618;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling all queued operations: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    long long v13 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
    [v13 cancelAllOperationsWithError:v4];
  }
}

- (HAPSecuritySession)securitySession
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = *(id *)&self->_featureFlags;
  os_unfair_lock_unlock(p_lock);

  return (HAPSecuritySession *)v4;
}

- (void)setSecuritySession:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = *(void **)&self->_featureFlags;
  *(void *)&self->_featureFlags = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (BOOL)isSecuritySessionOpen
{
  id v2 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  unsigned __int8 v3 = [v2 isOpen];

  return v3;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  unsigned __int8 v3 = NSStringFromSelector(a2);
  id v4 = +[NSString stringWithFormat:@"%@ is unavailable", v3];
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)_establishSecureSession
{
  if ([(HAPAccessoryServerBTLE *)self isPaired])
  {
    unsigned __int8 v3 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    if ([v3 isOpen])
    {

LABEL_9:
      long long v11 = self;
      long long v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        long long v13 = sub_100083FD0(v11);
        *(_DWORD *)buf = 138543362;
        __int16 v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@A security session is already established.", buf, 0xCu);
      }
      return;
    }
    int v9 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    unsigned int v10 = [v9 isOpening];

    if (v10) {
      goto LABEL_9;
    }
    int v14 = [[HAPSecuritySession alloc] initWithRole:0 resumeSessionID:[(HAPAccessoryServerBTLE *)self resumeSessionID] enhancedEncryption:self->_badPairSetupCode delegate:self];
    [(_HAPAccessoryServerBTLE200 *)self setSecuritySession:v14];
    [(HAPSecuritySession *)v14 open];
  }
  else
  {
    id v4 = self;
    id v5 = sub_100083F74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = sub_100083FD0(v4);
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v6;
      __int16 v17 = 2112;
      CFStringRef v18 = @"Unable to establish a secure session because the accessory isn't paired.";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    uint64_t v7 = +[NSError hapErrorWithcode:3 description:@"Unable to establish a secure session because the accessory isn't paired." reason:0 suggestion:0 underlyingError:0];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      [(_HAPAccessoryServerBTLE200 *)v4 disconnectWithCompletionHandler:0 disconnectionError:v7];
    }
  }
}

- (void)_handleSecuritySessionSetupExchangeData:(id)a3
{
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self pairVerifyCharacteristic];
  if (v5)
  {
    objc_initWeak(location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006F824;
    v11[3] = &unk_100273FF0;
    objc_copyWeak(&v13, location);
    id v12 = v5;
    [(_HAPAccessoryServerBTLE200 *)self _writeValue:v4 toCharacteristic:v12 authorizationData:0 contextData:0 options:18 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    unint64_t v6 = self;
    uint64_t v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = sub_100083FD0(v6);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@Security session setup exchange failed, missing the Pair Verify characteristic", (uint8_t *)location, 0xCu);
    }
    int v9 = +[NSError hapErrorWithcode:9 description:@"Security session setup exchange failed." reason:@"Missing Pair Verify characteristic." suggestion:0 underlyingError:0];
    unsigned int v10 = [(_HAPAccessoryServerBTLE200 *)v6 securitySession];
    [v10 receivedSetupExchangeData:0 error:v9];
  }
}

- (HAPCharacteristic)pairVerifyCharacteristic
{
  p_pairSetupCharacteristic = &self->_pairSetupCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairSetupCharacteristic);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    unint64_t v6 = [v5 servicesOfType:@"00000010-0000-1000-8000-4D69736D6574"];
    uint64_t v7 = [v6 firstObject];

    uint64_t v8 = [v7 characteristicsOfType:@"00000012-0000-1000-8000-4D69736D6574"];
    int v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairSetupCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairSetupCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (id)protocolInfoServiceSignatureCharacteristics
{
  id v2 = [(HAPAccessoryServer *)self primaryAccessory];
  unsigned __int8 v3 = [v2 servicesOfType:@"000000A2-0000-1000-8000-4D69736D6574"];
  id v4 = [v3 firstObject];

  id v5 = [v4 characteristicsOfType:@"000000A5-0000-1000-8000-4D69736D6574"];
  unint64_t v6 = [v5 firstObject];

  return v6;
}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = sub_100083FD0(v7);
    int v17 = 138543618;
    CFStringRef v18 = v9;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Encrypting plaintext data: %@", (uint8_t *)&v17, 0x16u);
  }
  id v10 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];

  if (v10)
  {
    long long v11 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];
LABEL_7:
    int v14 = v11;
    id v15 = [v11 encryptData:v6 additionalAuthenticatedData:0 error:a4];

    goto LABEL_8;
  }
  id v12 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
  unsigned int v13 = [v12 isSecureSession];

  if (v13)
  {
    long long v11 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
    goto LABEL_7;
  }
  if (a4)
  {
    +[NSError hapErrorWithcode:3 description:@"Missing security session." reason:0 suggestion:0 underlyingError:0];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_8:

  return v15;
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = sub_100083FD0(v7);
    int v17 = 138543618;
    CFStringRef v18 = v9;
    __int16 v19 = 2048;
    id v20 = [v6 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Decrypting data with length %lu", (uint8_t *)&v17, 0x16u);
  }
  id v10 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];

  if (v10)
  {
    long long v11 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];
LABEL_7:
    int v14 = v11;
    id v15 = [v11 decryptData:v6 additionalAuthenticatedData:0 error:a4];

    goto LABEL_8;
  }
  id v12 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
  unsigned int v13 = [v12 isSecureSession];

  if (v13)
  {
    long long v11 = [(_HAPAccessoryServerBTLE200 *)v7 pairSetupSession];
    goto LABEL_7;
  }
  if (a4)
  {
    +[NSError hapErrorWithcode:3 description:@"Missing security session." reason:0 suggestion:0 underlyingError:0];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_8:

  return v15;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007000C;
  v7[3] = &unk_100272F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_cancelConnectionWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((id)[(_HAPAccessoryServerBTLE200 *)self connectionState] == (id)1)
  {
    id v6 = self;
    uint64_t v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = sub_100083FD0(v6);
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v8;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection with error: %@", buf, 0x16u);
    }
    id v5 = v4;
    if (!v4)
    {
      id v5 = +[NSError hapErrorWithcode:2 description:@"Connection failed." reason:@"Connection was cancelled." suggestion:0 underlyingError:0];
    }
    uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)v6 connectionCompletionHandler];
    id v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v5);
    }
    [(_HAPAccessoryServerBTLE200 *)v6 setConnectionCompletionHandler:0];
    long long v11 = [(_HAPAccessoryServerBTLE200 *)v6 discoveryContext];

    if (v11) {
      [(_HAPAccessoryServerBTLE200 *)v6 _cancelDiscoveryWithError:v5];
    }
    if ([(_HAPAccessoryServerBTLE200 *)v6 isPairing])
    {
      id v12 = [v5 userInfo];
      id v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (!v13) {
        id v13 = v5;
      }
      __int16 v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      CFStringRef v18 = sub_1000707C8;
      __int16 v19 = &unk_100273040;
      id v20 = v6;
      id v21 = v13;
      id v14 = v13;
      sub_1000707C8((uint64_t)&v16);
    }
    id v15 = [(HAPAccessoryServerBTLE *)v6 browser];
    [v15 disconnectFromBTLEAccessoryServer:v6];
  }
}

- (void)disconnectWithCompletionHandler:(id)a3
{
}

- (void)disconnectWithCompletionHandler:(id)a3 disconnectionError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000709C0;
  block[3] = &unk_100274040;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070E14;
  v6[3] = &unk_100273178;
  void v6[4] = self;
  unsigned __int8 v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  int v3 = a3;
  -[HAPAccessoryServerBTLE setConnectionIdleTime:](self, "setConnectionIdleTime:");
  double v5 = 5.0;
  if (v3 == 1) {
    double v5 = 2.0;
  }
  if (v3 == 2) {
    double v5 = 15.0;
  }

  [(_HAPAccessoryServerBTLE200 *)self _restartConnectionIdleTimer:v5];
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
  double v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v7 = sub_100083FD0(v5);
    int v13 = 138543618;
    id v14 = v7;
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Updating connectionIdle time to: %f", (uint8_t *)&v13, 0x16u);
  }
  id v8 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:0 options:a3];
  [(_HAPAccessoryServerBTLE200 *)v5 setConnectionIdleTimer:v8];

  id v9 = [(_HAPAccessoryServerBTLE200 *)v5 connectionIdleTimer];
  [v9 setDelegate:v5];

  id v10 = [(_HAPAccessoryServerBTLE200 *)v5 connectionIdleTimer];
  long long v11 = [(HAPAccessoryServer *)v5 clientQueue];
  [v10 setDelegateQueue:v11];

  id v12 = [(_HAPAccessoryServerBTLE200 *)v5 connectionIdleTimer];
  [v12 resume];
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000710D0;
  block[3] = &unk_100273418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_handleConnectionWithError:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    int v12 = 138543618;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Connection completed with error: %@", (uint8_t *)&v12, 0x16u);
  }
  if (v4)
  {
    [(_HAPAccessoryServerBTLE200 *)v5 setConnectionState:0];
    [(_HAPAccessoryServerBTLE200 *)v5 _suspendConnectionIdleTimer];
  }
  else
  {
    id v8 = [(HAPAccessoryServerBTLE *)v5 browser];
    id v9 = [(HAPAccessoryServerBTLE *)v5 peripheral];
    [v8 setConnectionLatency:1 forPeripheral:v9];

    [(_HAPAccessoryServerBTLE200 *)v5 setConnectionState:2];
    [(_HAPAccessoryServerBTLE200 *)v5 _updateConnectionIdleTime:[(HAPAccessoryServerBTLE *)v5 connectionIdleTime]];
    [(_HAPAccessoryServerBTLE200 *)v5 _kickConnectionIdleTimer];
    [(HAPAccessoryServerBTLE *)v5 incrementHAPBTLEMetricsConnectionCount];
  }
  uint64_t v10 = [(_HAPAccessoryServerBTLE200 *)v5 connectionCompletionHandler];
  long long v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
  }
  [(_HAPAccessoryServerBTLE200 *)v5 setConnectionCompletionHandler:0];
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self connectionStartTime];
  if (v8)
  {
    id v9 = +[NSDate date];
    uint64_t v10 = [(HAPAccessoryServer *)self connectionStartTime];
    [v9 timeIntervalSinceDate:v10];
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }

  [(HAPAccessoryServer *)self setConnectionStartTime:0];
  id v13 = [(HAPAccessoryServer *)self clientQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100071438;
  v16[3] = &unk_100274068;
  id v17 = v6;
  CFStringRef v18 = self;
  uint64_t v20 = v12;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(v13, v16);
}

- (BOOL)_shouldResumeConnectionIdletimer
{
  if ([(HAPAccessoryServerBTLE *)self connectReason] == 8) {
    return 0;
  }
  else {
    return ![(_HAPAccessoryServerBTLE200 *)self waitingForAuth];
  }
}

- (void)_kickConnectionIdleTimer
{
  id v2 = [(_HAPAccessoryServerBTLE200 *)self connectionIdleTimer];
  [v2 kick];
}

- (void)_resumeConnectionIdleTimer
{
  if ([(_HAPAccessoryServerBTLE200 *)self _shouldResumeConnectionIdletimer])
  {
    int v3 = self;
    id v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v5 = sub_100083FD0(v3);
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@Resuming the connection idle timer...", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [(_HAPAccessoryServerBTLE200 *)v3 connectionIdleTimer];
    [v6 resume];
  }
}

- (void)_suspendConnectionIdleTimer
{
  id v2 = self;
  int v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = sub_100083FD0(v2);
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%{public}@Suspending the connection idle timer...", (uint8_t *)&v6, 0xCu);
  }
  double v5 = [(_HAPAccessoryServerBTLE200 *)v2 connectionIdleTimer];
  [v5 suspend];
}

- (void)_handleConnectionIdleTimeout
{
  int v3 = +[NSError errorWithDomain:@"HAPErrorDomain" code:24 userInfo:0];
  if ([(_HAPAccessoryServerBTLE200 *)self isPairing]) {
    [(_HAPAccessoryServerBTLE200 *)self setPairingDisconnectionError:v3];
  }
  int64_t v4 = [(_HAPAccessoryServerBTLE200 *)self connectionState];
  double v5 = self;
  int v6 = sub_100083F74();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v7)
    {
      id v8 = sub_100083FD0(v5);
      id v9 = [(HAPAccessoryServerBTLE *)v5 peripheral];
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, cancelling connection to the peripheral: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = +[NSError hapErrorWithcode:8 description:@"Connection Failed" reason:@"Connection request timed out" suggestion:0 underlyingError:v3];
    [(_HAPAccessoryServerBTLE200 *)v5 _cancelConnectionWithError:v10];
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = sub_100083FD0(v5);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, disconnecting from peripheral", (uint8_t *)&v12, 0xCu);
    }
    [(_HAPAccessoryServerBTLE200 *)v5 disconnectWithCompletionHandler:0 disconnectionError:v3];
  }
}

- (BOOL)isBLELinkConnected
{
  return (id)[(_HAPAccessoryServerBTLE200 *)self connectionState] == (id)2;
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HAPAccessoryServer *)self clientQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100071E0C;
  v13[3] = &unk_1002740B8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(_HAPAccessoryServerBTLE200 *)self _getProtocolInfoService];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000723F8;
  v13[3] = &unk_100274108;
  char v16 = v6;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(_HAPAccessoryServerBTLE200 *)self _configureBroadcastKeyGeneration:v6 service:v10 withCompletion:v13];
}

- (BOOL)_validateGeneratedBroadcastKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(HAPAccessoryServer *)self keyStore];
    id v27 = 0;
    id v28 = 0;
    id v26 = 0;
    uint64_t v6 = [(HAPAccessoryServer *)self identifier];
    id v25 = 0;
    unsigned int v7 = [v5 getControllerPublicKey:&v28 secretKey:&v27 username:&v26 allowCreation:0 forAccessory:v6 error:&v25];
    id v8 = v28;
    id v9 = v27;
    id v10 = v26;
    id v11 = v25;

    if (v7)
    {
      id v12 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
      id v13 = [v12 broadcastKey];
      unsigned __int8 v14 = [v13 isEqualToData:v4];

      if (v14)
      {
        BOOL v15 = 1;
LABEL_12:

        goto LABEL_13;
      }
      char v16 = self;
      id v17 = sub_100083F74();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v18 = sub_100083FD0(v16);
        *(_DWORD *)buf = 138543362;
        __int16 v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Generated Broadcast key does not match", buf, 0xCu);
      }
    }
    id v19 = self;
    uint64_t v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = sub_100083FD0(v19);
      id v22 = [(_HAPAccessoryServerBTLE200 *)v19 securitySession];
      __int16 v23 = [v22 broadcastKey];
      *(_DWORD *)buf = 138544642;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      __int16 v37 = 2112;
      id v38 = v4;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@Controller Public Key: %@, Controller Identifier: %@, \n\tGenerated Broadcast Key: %@, \n\tAccessory Broadcast Key: %@. Error: %@", buf, 0x3Eu);
    }
    BOOL v15 = 0;
    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate])
  {
    id v9 = [(HAPAccessoryServer *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072C6C;
      block[3] = &unk_100273418;
      void block[4] = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate])
  {
    unsigned int v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServerBTLE:didReceivePlaintextPayload:forCharacteristic:"];

    if (v9)
    {
      char v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072DE4;
      block[3] = &unk_100273418;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate])
  {
    unsigned int v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServerBTLE:willSendEncryptedAndAuthenticatedPayload:forCharacteristic:"];

    if (v9)
    {
      char v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072F5C;
      block[3] = &unk_100273418;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate])
  {
    unsigned int v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServerBTLE:willSendPlaintextPayload:forCharacteristic:"];

    if (v9)
    {
      char v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000730D4;
      block[3] = &unk_100273418;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 services];
  id v9 = [v8 copy];

  char v10 = self;
  id v11 = sub_100083F74();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = sub_100083FD0(v10);
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Discovered CB services: %@", buf, 0x16u);
  }
  id v13 = [(HAPAccessoryServer *)v10 clientQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000732E4;
  v17[3] = &unk_100274130;
  id v18 = v6;
  id v19 = v10;
  id v20 = v9;
  id v21 = v7;
  id v14 = v7;
  id v15 = v9;
  id v16 = v6;
  dispatch_async(v13, v17);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073410;
  block[3] = &unk_100273418;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000737DC;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100073930;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100073A84;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100073BD8;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100073D2C;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100074070;
  v15[3] = &unk_100274130;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100074314;
  v15[3] = &unk_100273778;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000745F4;
  v11[3] = &unk_100273040;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)controlOutputStreamDidComplete:(id)a3
{
  id v4 = a3;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007470C;
  block[3] = &unk_100273018;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074850;
  block[3] = &unk_100273418;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  double v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Request for local pairing identity", (uint8_t *)&v14, 0xCu);
  }
  id v8 = [(HAPAccessoryServer *)v5 pairingRequest];
  uint64_t v9 = [v8 pairingIdentity];
  if (v9)
  {
    id v10 = (void *)v9;
LABEL_5:

    goto LABEL_7;
  }
  id v11 = [(HAPAccessoryServer *)v5 keyBag];
  id v10 = [v11 currentIdentity];

  if (!v10)
  {
    id v8 = [(HAPAccessoryServer *)v5 keyStore];
    id v13 = [(HAPAccessoryServer *)v5 identifier];
    id v10 = [v8 readControllerPairingKeyForAccessory:v13 error:a4];

    goto LABEL_5;
  }
LABEL_7:

  return v10;
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = sub_100083FD0(v8);
    *(_DWORD *)buf = 138543618;
    __int16 v37 = v10;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Request to save pairing peer: %@", buf, 0x16u);
  }
  id v11 = [v7 identifier];
  id v12 = [(HAPAccessoryServer *)v8 identifier];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    int v14 = [v7 publicKey];
    id v15 = [v14 data];

    id v16 = [(HAPAccessoryServer *)v8 keyStore];
    id v17 = [v7 identifier];
    id v35 = 0;
    unsigned __int8 v18 = [v16 savePublicKey:v15 forAccessoryName:v17 error:&v35];
    id v19 = v35;

    if (v18)
    {
      [(HAPAccessoryServer *)v8 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v15];
      id v34 = 0;
      unsigned __int8 v20 = [(HAPAccessoryServerBTLE *)v8 updatePeripheralIdentifier:&v34 isPairing:1];
      id v21 = v34;
      if ((v20 & 1) == 0)
      {
        id v22 = v8;
        __int16 v23 = sub_100083F74();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = sub_100083FD0(v22);
          *(_DWORD *)buf = 138543618;
          __int16 v37 = v24;
          __int16 v38 = 2112;
          id v39 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the accessory's peripheral identifier with error: %@", buf, 0x16u);
        }
        if (a5) {
          *a5 = v21;
        }
      }
    }
    else
    {
      __int16 v30 = v8;
      __int16 v31 = sub_100083F74();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = sub_100083FD0(v30);
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v32;
        __int16 v38 = 2112;
        id v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to save accessory's identifier and public key to the keystore with error: %@", buf, 0x16u);
      }
      unsigned __int8 v20 = 0;
      if (a5) {
        *a5 = v19;
      }
    }
  }
  else
  {
    id v25 = v8;
    id v26 = sub_100083F74();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = sub_100083FD0(v25);
      id v28 = [v7 identifier];
      unsigned __int8 v29 = [(HAPAccessoryServer *)v25 identifier];
      *(_DWORD *)buf = 138543874;
      __int16 v37 = v27;
      __int16 v38 = 2112;
      id v39 = v28;
      __int16 v40 = 2112;
      long long v41 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@The peer's identifier exchanged during Pair Setup, %@, does not match the identifier from the accessory's advertisement, %@", buf, 0x20u);
    }
    if (a5)
    {
      +[NSError hapErrorWithcode:7 description:@"Pairing failed." reason:@"The peer's identifier does not match it's advertised identifier" suggestion:0 underlyingError:0];
      unsigned __int8 v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v20 = 0;
    }
  }

  return v20;
}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074FA4;
  block[3] = &unk_100273418;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000750E4;
  block[3] = &unk_100273418;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075224;
  block[3] = &unk_100273108;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4 = a3;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000753CC;
  v7[3] = &unk_100273040;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6 = a3;
  id v7 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075598;
  block[3] = &unk_100273D48;
  id v11 = v6;
  id v12 = self;
  double v13 = a4;
  id v8 = v6;
  dispatch_async(v7, block);

  return 0;
}

- (void)getAccessoryInfo:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000757A0;
  block[3] = &unk_100274180;
  id v8 = v4;
  id v9 = v10;
  void block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (BOOL)_validateProtocolInfo:(id)a3
{
  id v4 = a3;
  double v5 = [v4 deviceIdentifer];
  id v6 = [(HAPAccessoryServer *)self identifier];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_7;
  }
  unsigned int v7 = [v4 categoryIdentifier];
  id v8 = [(HAPAccessoryServer *)self category];
  if (v7 != [v8 unsignedShortValue]
    || (unsigned int v9 = [v4 featureFlags],
        v9 != [(_HAPAccessoryServerBTLE200 *)self featureFlags]))
  {

LABEL_7:
    goto LABEL_8;
  }
  id v10 = [v4 protocolVersion];
  id v11 = [v10 majorVersion];
  id v12 = [(HAPAccessoryServer *)self version];
  id v13 = [v12 majorVersion];

  if (v11 == v13)
  {
    BOOL v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  id v15 = self;
  id v16 = sub_100083F74();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = sub_100083FD0(v15);
    unsigned __int8 v18 = [(HAPAccessoryServer *)v15 identifier];
    id v19 = [(HAPAccessoryServer *)v15 category];
    unint64_t v20 = [(HAPAccessoryServer *)v15 authMethod];
    id v21 = [(HAPAccessoryServer *)v15 version];
    int v23 = 138544642;
    __int16 v24 = v17;
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    __int16 v30 = v19;
    __int16 v31 = 2048;
    unint64_t v32 = v20;
    __int16 v33 = 2112;
    id v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match: identifier: %@, category: %@, authMethods: %tu version: %@", (uint8_t *)&v23, 0x3Eu);
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)authenticateAccessory
{
  int v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075DE8;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  id v4 = self;
  double v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = sub_100083FD0(v4);
    unsigned int v7 = sub_100022E44([(HAPAccessoryServer *)v4 authMethod]);
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2112;
    BOOL v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current Auth Method %@", buf, 0x16u);
  }
  id v8 = [(HAPAccessoryServer *)v4 clientQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100075F94;
  v9[3] = &unk_100273178;
  v9[4] = v4;
  BOOL v10 = a3;
  dispatch_async(v8, v9);
}

- (void)provisionToken:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543618;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);
  }
  id v8 = [(HAPAccessoryServer *)v5 clientQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000763A8;
  void v10[3] = &unk_100273040;
  v10[4] = v5;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)tearDownSessionOnAuthCompletion
{
  int v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076484;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_continuePairingAfterMFiCertValidation
{
  [(_HAPAccessoryServerBTLE200 *)self tearDownSessionOnAuthCompletion];
  [(_HAPAccessoryServerBTLE200 *)self setPairing:0];
  [(_HAPAccessoryServerBTLE200 *)self setBadPairSetupCode:0];
  [(_HAPAccessoryServerBTLE200 *)self setPairSetupBackoffTimeInterval:0.0];
  [(_HAPAccessoryServerBTLE200 *)self setPairSetupSession:0];

  [(_HAPAccessoryServerBTLE200 *)self _notifyDelegatesPairingStopped:0];
}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:"accessoryServer:didStopPairingWithError:"])
  {
    double v5 = [(HAPAccessoryServer *)self delegateQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007667C;
    v6[3] = &unk_100273040;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007685C;
  v8[3] = &unk_100273040;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100076DE0;
  v15[3] = &unk_100274130;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100077160;
  v15[3] = &unk_100274130;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100077484;
  v15[3] = &unk_100274130;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007775C;
  v8[3] = &unk_100273040;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self metric_pairVerifyReason];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    id v8 = [v7 sessionStartTime];

    if (v8)
    {
      mach_absolute_time();
      uint64_t v9 = UpTicksToMilliseconds();
      id v10 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
      -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", v9 - (void)[v10 sessionStartTime]);

      v11.receiver = self;
      v11.super_class = (Class)_HAPAccessoryServerBTLE200;
      [(HAPAccessoryServer *)&v11 submitPairVerifyMetricWithError:v4];
    }
  }
}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  uint64_t v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100083FD0(v5);
    int v10 = 138543362;
    objc_super v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Request for local pairing identity", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(_HAPAccessoryServerBTLE200 *)v5 getLocalPairingIdentityWithError:a4];

  return v8;
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self identifier];
  unsigned __int8 v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    int v10 = [(HAPAccessoryServer *)self keyStore];
    id v24 = 0;
    objc_super v11 = [v10 readPublicKeyForAccessoryName:v7 registeredWithHomeKit:0 error:&v24];
    id v12 = v24;

    if (v11)
    {
      id v13 = (_HAPAccessoryServerBTLE200 *)[objc_alloc((Class)HMFPairingKey) initWithPairingKeyData:v11];
      id v14 = [[HAPPairingIdentity alloc] initWithIdentifier:v7 publicKey:v13 privateKey:0 permissions:0];
      if (!v14)
      {
        id v15 = self;
        id v16 = sub_100083F74();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = sub_100083FD0(v15);
          *(_DWORD *)buf = 138543874;
          id v26 = v17;
          __int16 v27 = 2112;
          id v28 = v7;
          __int16 v29 = 2112;
          id v30 = v11;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@Failed to create pairing identity with identififer, %@, public key, %@", buf, 0x20u);
        }
        if (a5)
        {
          *a5 = +[NSError hapErrorWithcode:1 description:@"Failed to retrieve peer pairing identity." reason:@"Failed to create pairing identity" suggestion:0 underlyingError:0];
        }
      }
    }
    else
    {
      id v13 = self;
      id v21 = sub_100083F74();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543874;
        id v26 = v22;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrived public key for accessory with identifier '%@' with error: %@", buf, 0x20u);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v18 = self;
    id v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v20 = sub_100083FD0(v18);
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@Unexpected pairing peer identifier, %@", buf, 0x16u);
    }
    if (a5)
    {
      +[NSError hapErrorWithcode:16 description:@"Insufficient Authorization." reason:@"Unexpected pairing peer identifier." suggestion:0 underlyingError:0];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007814C;
  block[3] = &unk_100273418;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)securitySessionIsOpening:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000782F4;
  v7[3] = &unk_100273040;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078494;
  v7[3] = &unk_100273040;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 underlyingErrors];
  uint64_t v5 = [v4 firstObject];

  BOOL v6 = (([v3 isHAPError] & 1) != 0 || objc_msgSend(v5, "isHAPError"))
    && ([v3 code] == (id)27 || [v5 code] == (id)27);

  return v6;
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007876C;
  block[3] = &unk_100273418;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_HAPAccessoryServerBTLE200 *)self connectionIdleTimer];

  if (v6 == v4)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100078C08;
    v22[3] = &unk_100273018;
    void v22[4] = self;
    sub_100078C08((uint64_t)v22);
    [(_HAPAccessoryServerBTLE200 *)self _handleConnectionIdleTimeout];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = [v12 responseTimer];

          if (v13 == v4)
          {
            id v14 = self;
            id v15 = sub_100083F74();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              id v16 = sub_100083FD0(v14);
              *(_DWORD *)buf = 138543618;
              id v24 = v16;
              __int16 v25 = 2112;
              id v26 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Cancelling the timed out request: %@", buf, 0x16u);
            }
            id v17 = +[NSError hapErrorWithcode:24 description:@"Request failed." reason:@"Request timed out waiting for response." suggestion:0 underlyingError:0];
            [v12 cancelWithError:v17];

            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)disconnect
{
  id v2 = self;
  id v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100083FD0(v2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Disconnecting as a result of direct disconnect call", (uint8_t *)&v5, 0xCu);
  }
  [(_HAPAccessoryServerBTLE200 *)v2 disconnectWithCompletionHandler:0];
}

+ (id)logCategory
{
  if (qword_1002AD6A0 != -1) {
    dispatch_once(&qword_1002AD6A0, &stru_1002741C8);
  }
  id v2 = (void *)qword_1002AD6A8;

  return v2;
}

- (int64_t)connectionState
{
  return (int64_t)self->_securitySession;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_securitySession = (HAPSecuritySession *)a3;
}

- (HAPBLEAccessoryCache)accessoryCache
{
  return (HAPBLEAccessoryCache *)self->_connectionState;
}

- (void)setAccessoryCache:(id)a3
{
}

- (id)connectionCompletionHandler
{
  return self->_accessoryCache;
}

- (void)setConnectionCompletionHandler:(id)a3
{
}

- (HMFTimer)connectionIdleTimer
{
  return (HMFTimer *)self->_connectionCompletionHandler;
}

- (void)setConnectionIdleTimer:(id)a3
{
}

- (_HAPBTLEDiscoveryContext)discoveryContext
{
  return (_HAPBTLEDiscoveryContext *)self->_connectionIdleTimer;
}

- (void)setDiscoveryContext:(id)a3
{
}

- (int64_t)discoveryRetries
{
  return (int64_t)self->_discoveryContext;
}

- (void)setDiscoveryRetries:(int64_t)a3
{
  self->_discoveryContext = (_HAPBTLEDiscoveryContext *)a3;
}

- (BOOL)isVerified
{
  return BYTE6(self->super._blePeripheral);
}

- (void)setVerified:(BOOL)a3
{
  BYTE6(self->super._blePeripheral) = a3;
}

- (void)setIdentifyCharacteristic:(id)a3
{
}

- (HAPPairSetupSession)pairSetupSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifyCharacteristic);

  return (HAPPairSetupSession *)WeakRetained;
}

- (void)setPairSetupSession:(id)a3
{
}

- (double)pairSetupBackoffTimeInterval
{
  return *(double *)&self->_pairSetupSession;
}

- (void)setPairSetupBackoffTimeInterval:(double)a3
{
  *(double *)&self->_pairSetupSession = a3;
}

- (BOOL)isBadSetupCode
{
  return HIBYTE(self->super._blePeripheral);
}

- (void)setBadPairSetupCode:(BOOL)a3
{
  HIBYTE(self->super._blePeripheral) = a3;
}

- (id)setupCodeCompletionHandler
{
  return *(id *)&self->_pairSetupBackoffTimeInterval;
}

- (void)setSetupCodeCompletionHandler:(id)a3
{
}

- (BOOL)isPairing
{
  return self->_hasValidCache;
}

- (void)setPairing:(BOOL)a3
{
  self->_hasValidCache = a3;
}

- (NSError)pairingDisconnectionError
{
  return (NSError *)self->_setupCodeCompletionHandler;
}

- (void)setPairingDisconnectionError:(id)a3
{
}

- (BOOL)authenticated
{
  return self->_hasBeenDiscovered;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_hasBeenDiscovered = a3;
}

- (BOOL)waitingForAuth
{
  return self->_verified;
}

- (void)setWaitingForAuth:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)enhancedEncryption
{
  return self->_badPairSetupCode;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_badPairSetupCode = a3;
}

- (HAPAuthSession)authSession
{
  return (HAPAuthSession *)self->_pairingDisconnectionError;
}

- (void)setAuthSession:(id)a3
{
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return (HAPAccessoryProtocolInfo *)self->_authSession;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
}

- (void)setPairSetupCharacteristic:(id)a3
{
}

- (void)setPairVerifyCharacteristic:(id)a3
{
}

- (NSOperationQueue)pairVerifyOperationQueue
{
  return (NSOperationQueue *)self->_pairVerifyCharacteristic;
}

- (void)setPairingsCharacteristic:(id)a3
{
}

- (NSMutableArray)pendingRequests
{
  return (NSMutableArray *)self->_pairingsCharacteristic;
}

- (NSOperationQueue)requestOperationQueue
{
  return (NSOperationQueue *)self->_pendingRequests;
}

- (NSMutableArray)pendingResponses
{
  return (NSMutableArray *)self->_requestOperationQueue;
}

- (NSMapTable)characteristicWriteCompletionHandlers
{
  return (NSMapTable *)self->_pendingResponses;
}

- (NSMapTable)characteristicEnableEventCompletionHandlers
{
  return self->_characteristicWriteCompletionHandlers;
}

- (unsigned)featureFlags
{
  return self->_pairing;
}

- (void)setFeatureFlags:(unsigned __int8)a3
{
  self->_pairing = a3;
}

- (NSMutableSet)discoveredAccessoryCharacteriticsPendingRead
{
  return (NSMutableSet *)self->_characteristicEnableEventCompletionHandlers;
}

- (void)setDiscoveredAccessoryCharacteriticsPendingRead:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicEnableEventCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_characteristicWriteCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pairingsCharacteristic, 0);
  objc_destroyWeak((id *)&self->_pairVerifyOperationQueue);
  objc_storeStrong((id *)&self->_pairVerifyCharacteristic, 0);
  objc_destroyWeak((id *)&self->_pairSetupCharacteristic);
  objc_destroyWeak((id *)&self->_pairingFeaturesCharacteristic);
  objc_destroyWeak((id *)&self->_authenticatedProtocolInfo);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_pairingDisconnectionError, 0);
  objc_storeStrong(&self->_setupCodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairSetupBackoffTimeInterval, 0);
  objc_destroyWeak((id *)&self->_identifyCharacteristic);
  objc_destroyWeak((id *)&self->_discoveryRetries);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong(&self->_connectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end