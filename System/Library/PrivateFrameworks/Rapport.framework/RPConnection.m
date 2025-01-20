@interface RPConnection
- (BOOL)_clientError:(id)a3;
- (BOOL)_pairVerifyVerifySignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 error:(id *)a6;
- (BOOL)_receivedSystemInfo:(id)a3 xid:(id)a4;
- (BOOL)_serverPairingAllowed;
- (BOOL)canDecode128bit;
- (BOOL)clientMode;
- (BOOL)containsInUseProcess:(int)a3;
- (BOOL)flowControlReadEnabled;
- (BOOL)invalidationHandled;
- (BOOL)preAuthEnabled;
- (BOOL)present;
- (CUBLEConnection)bleConnection;
- (CUBluetoothScalablePipe)btPipe;
- (CUBluetoothScalablePipe)btPipeHighPriority;
- (CUBonjourDevice)bonjourPeerDevice;
- (CUHomeKitManager)homeKitManager;
- (CUNetLinkManager)netLinkManager;
- (CUTCPConnection)tcpConnection;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSData)pskData;
- (NSDictionary)appInfoPeer;
- (NSDictionary)appInfoSelf;
- (NSMutableArray)proxyDevices;
- (NSMutableArray)receivedMessages;
- (NSMutableSet)inUseProcesses;
- (NSString)appID;
- (NSString)clientBundleID;
- (NSString)destinationString;
- (NSString)identifierOverride;
- (NSString)label;
- (NSString)password;
- (NSString)peerAddrString;
- (NSString)peerHomeKitUserIdentifier;
- (NSString)peerIdentifier;
- (NSString)serviceType;
- (NSUUID)blePeerIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPCloudDaemon)cloudDaemon;
- (RPCompanionLinkDevice)localDeviceInfo;
- (RPCompanionLinkDevice)peerDeviceInfo;
- (RPConnection)init;
- (RPIdentity)forcedPeerIdentity;
- (RPIdentity)forcedSelfIdentity;
- (RPIdentity)identityResolved;
- (RPIdentity)identityVerified;
- (RPIdentityDaemon)identityDaemon;
- (id)_allowedMACAddressesForMCFeature:(id)a3;
- (id)_getCurrentProcessName;
- (id)_identityProofDataClient;
- (id)_identityProofDataServer;
- (id)_pairVerifySignData:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)_systeminfo;
- (id)authCompletionHandler;
- (id)client;
- (id)configurePairingHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)flowControlWriteChangedHandler;
- (id)hidePasswordHandler;
- (id)homeKitUserIdentifierHandler;
- (id)inUseProcessesToString;
- (id)invalidationHandler;
- (id)pairVerifyCompletion;
- (id)peerUpdatedHandler;
- (id)promptForPasswordHandler;
- (id)proxyDeviceUpdateHandler;
- (id)readErrorHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)sessionStartHandler;
- (id)showPasswordHandler;
- (id)stateChangedHandler;
- (int)flowControlWriteState;
- (int)keepAliveSeconds;
- (int)linkType;
- (int)pairVerifyAuthType;
- (int)passwordType;
- (int)passwordTypeActual;
- (int)preferredIdentityType;
- (int)state;
- (int64_t)bleClientUseCase;
- (unint64_t)controlFlags;
- (unint64_t)statusFlags;
- (unint64_t)statusFlagsUsingIdentities:(id)a3;
- (unsigned)bleConnectionPSM;
- (unsigned)flags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (unsigned)trafficFlags;
- (void)_abortRequestsWithError:(id)a3;
- (void)_clientConnectCompleted:(id)a3;
- (void)_clientConnectStart;
- (void)_clientConnectStartBLE;
- (void)_clientConnectStartBTPipe;
- (void)_clientConnectStartTCP;
- (void)_clientNetworkError:(id)a3 label:(const char *)a4;
- (void)_clientPairSetupCompleted:(id)a3;
- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 handler:(id)a5;
- (void)_clientPairSetupStart;
- (void)_clientPairSetupWithData:(id)a3;
- (void)_clientPairVerifyCompleted:(id)a3;
- (void)_clientPairVerifyStart;
- (void)_clientPairVerifyWithData:(id)a3;
- (void)_clientPreAuthResponseWithData:(id)a3;
- (void)_clientPreAuthStart;
- (void)_clientRetryFired;
- (void)_clientRetryStart;
- (void)_clientRun;
- (void)_clientStartSession;
- (void)_clientStarted;
- (void)_configureForSessionPairing:(id)a3;
- (void)_identityProofsAdd:(id)a3 update:(BOOL)a4;
- (void)_identityProofsAddWithHomeKitUUID:(id)a3;
- (void)_identityProofsVerify:(id)a3;
- (void)_identityProofsVerifyHomeKitSignature:(id)a3 identifier:(id)a4;
- (void)_idleTimerFired;
- (void)_idleTimerStart:(unsigned int)a3 repeat:(unsigned int)a4;
- (void)_invalidate;
- (void)_invalidateCore:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_invalidated;
- (void)_logConnectionInvalidatedWithError:(id)a3;
- (void)_pairSetupInvalidate;
- (void)_pairVerifyInvalidate;
- (void)_processSends;
- (void)_pskPrepare:(BOOL)a3;
- (void)_receiveCompletion:(id)a3 readFrame:(id *)a4 requestable:(id)a5;
- (void)_receiveStart:(id)a3 readFrame:(id *)a4 requestable:(id)a5;
- (void)_receivedEvent:(id)a3 ctx:(id *)a4;
- (void)_receivedHeader:(id *)a3 body:(id)a4 ctx:(id *)a5;
- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4 ctx:(id *)a5;
- (void)_receivedObject:(id)a3 ctx:(id *)a4;
- (void)_receivedRequest:(id)a3 ctx:(id *)a4;
- (void)_receivedResponse:(id)a3 ctx:(id *)a4;
- (void)_run;
- (void)_sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)_sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 sendEntry:(id)a7 responseHandler:(id)a8;
- (void)_sendEncryptedResponse:(id)a3 options:(id)a4 error:(id)a5 xid:(id)a6 requestID:(id)a7 highPriority:(BOOL)a8 isChatty:(BOOL)a9 replyStartTime:(id)a10;
- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4;
- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4;
- (void)_serverAccept;
- (void)_serverAcceptBLE;
- (void)_serverAcceptBTPipe;
- (void)_serverAcceptTCP;
- (void)_serverError:(id)a3;
- (void)_serverNetworkError:(id)a3 label:(const char *)a4;
- (void)_serverPairSetupCompleted:(id)a3;
- (void)_serverPairSetupWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPairVerifyCompleted:(id)a3;
- (void)_serverPairVerifyWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPreAuthRequestWithData:(id)a3;
- (void)_serverRun;
- (void)_serverStarted;
- (void)_timeoutForSendEntry:(id)a3;
- (void)_timeoutForXID:(id)a3;
- (void)_updateExternalState;
- (void)_updateLinkInfo;
- (void)activate;
- (void)addInUseProcess:(int)a3;
- (void)dealloc;
- (void)homeKitIdentityUpdated;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)processSendsUsingConnection:(id)a3;
- (void)removeInUseProcess:(int)a3;
- (void)sameAccountIdentityUpdated;
- (void)sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)sendEncryptedEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendReachabilityProbe:(const char *)a3;
- (void)sessionStopped:(id)a3;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppInfoSelf:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setBleClientUseCase:(int64_t)a3;
- (void)setBleConnection:(id)a3;
- (void)setBleConnectionPSM:(unsigned __int16)a3;
- (void)setBlePeerIdentifier:(id)a3;
- (void)setBonjourPeerDevice:(id)a3;
- (void)setBtPipe:(id)a3;
- (void)setBtPipeHighPriority:(id)a3;
- (void)setCanDecode128bit:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientMode:(BOOL)a3;
- (void)setCloudDaemon:(id)a3;
- (void)setConfigurePairingHandler:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDestinationString:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlReadEnabled:(BOOL)a3;
- (void)setFlowControlWriteChangedHandler:(id)a3;
- (void)setForcedPeerIdentity:(id)a3;
- (void)setForcedSelfIdentity:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setHomeKitManager:(id)a3;
- (void)setHomeKitUserIdentifierHandler:(id)a3;
- (void)setIdentifierOverride:(id)a3;
- (void)setIdentityDaemon:(id)a3;
- (void)setIdentityResolved:(id)a3;
- (void)setInUseProcesses:(id)a3;
- (void)setInvalidationHandled:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAliveSeconds:(int)a3;
- (void)setLabel:(id)a3;
- (void)setLocalDeviceInfo:(id)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyCompletion:(id)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setPeerUpdatedHandler:(id)a3;
- (void)setPreAuthEnabled:(BOOL)a3;
- (void)setPreferredIdentityType:(int)a3;
- (void)setPresent:(BOOL)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setProxyDeviceUpdateHandler:(id)a3;
- (void)setProxyDevices:(id)a3;
- (void)setPskData:(id)a3;
- (void)setReadErrorHandler:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedMessages:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionStartHandler:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setState:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)setTcpConnection:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)tryPassword:(id)a3;
@end

@implementation RPConnection

- (RPConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)RPConnection;
  v2 = [(RPConnection *)&v12 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_flowControlReadEnabled = 1;
    v4 = objc_alloc_init(RPCompanionLinkDevice);
    peerDeviceInfo = v3->_peerDeviceInfo;
    v3->_peerDeviceInfo = v4;

    [(RPCompanionLinkDevice *)v3->_peerDeviceInfo setDaemon:1];
    *(void *)&v3->_pairSetupFlags = 0x40000000000018;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    receivedMessages = v3->_receivedMessages;
    v3->_receivedMessages = v8;

    v3->_ucat = (LogCategory *)&gLogCategory_RPCnx;
    RandomBytes();
    v3->_readFrame.header = 0;
    *(_WORD *)&v3->_readFrame.receivingHeader = 0;
    v3->_readFrameBTPipeHighPriority.header = 0;
    *(_WORD *)&v3->_readFrameBTPipeHighPriority.receivingHeader = 0;
    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RPConnection;
  [(RPConnection *)&v4 dealloc];
}

- (id)description
{
  return [(RPConnection *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  v5 = self->_peerDeviceInfo;
  BOOL v6 = shouldPrintSensitiveData();
  uint64_t v135 = 0;
  NSAppendPrintF();
  id v134 = 0;
  unint64_t retryCount = (unint64_t)_StateToString(self->_internalState);
  NSAppendPrintF();
  id v7 = v134;

  unsigned int linkType = self->_linkType;
  if (linkType)
  {
    id v133 = v7;
    if (linkType > 0xB) {
      v9 = "?";
    }
    else {
      v9 = off_1E605C588[linkType - 1];
    }
    unint64_t retryCount = (unint64_t)v9;
    NSAppendPrintF();
    id v10 = v133;

    id v7 = v10;
  }
  trafficFlags = (const char *)self->_trafficFlags;
  if (trafficFlags)
  {
    v132[1] = v7;
    unint64_t retryCount = (unint64_t)trafficFlags;
    v126 = &unk_1B3970BE8;
    NSAppendPrintF();
    id v12 = v7;

    id v7 = v12;
  }
  if (self->_pairVerifyCompleted)
  {
    if (self->_pairVerifyUsedIdentity)
    {
      v132[0] = v7;
      v13 = (id *)v132;
    }
    else
    {
      id v131 = v7;
      v13 = &v131;
    }
  }
  else
  {
    if (!self->_mainStream) {
      goto LABEL_15;
    }
    id v130 = v7;
    v13 = &v130;
  }
  NSAppendPrintF();
  id v14 = *v13;

  id v7 = v14;
LABEL_15:
  unsigned int passwordType = self->_passwordType;
  if (passwordType)
  {
    if (passwordType > 0xB) {
      v16 = "?";
    }
    else {
      v16 = off_1E605C5E0[passwordType - 1];
    }
    unint64_t retryCount = (unint64_t)v16;
    NSAppendPrintF();
    id v17 = v7;

    id v7 = v17;
  }
  unsigned int pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType)
  {
    if (pairVerifyAuthType > 0xA) {
      v19 = "?";
    }
    else {
      v19 = off_1E605C638[pairVerifyAuthType - 1];
    }
    unint64_t retryCount = (unint64_t)v19;
    NSAppendPrintF();
    id v20 = v7;

    id v7 = v20;
  }
  if (self->_retryCount > 0)
  {
    unint64_t retryCount = self->_retryCount;
    NSAppendPrintF();
    id v21 = v7;

    id v7 = v21;
  }
  v22 = self->_stepError;
  v23 = v22;
  if (v22)
  {
    unint64_t retryCount = (unint64_t)v22;
    NSAppendPrintF();
    id v24 = v7;

    id v7 = v24;
  }

  uint64_t v25 = [(RPConnection *)self inUseProcessesToString];
  v26 = (void *)v25;
  if (v25)
  {
    unint64_t controlFlags = v25;
    NSAppendPrintF();
    id v27 = v7;

    id v7 = v27;
  }

  if (v6)
  {
    peerIdentifier = self->_peerIdentifier;
    if (peerIdentifier)
    {
      int v29 = 0;
      v30 = self->_peerIdentifier;
    }
    else
    {
      uint64_t v31 = [(RPEndpoint *)v5 identifier];
      v26 = (void *)v31;
      if (v31)
      {
        int v29 = 0;
        v30 = (void *)v31;
      }
      else
      {
        v30 = [(RPCompanionLinkDevice *)v5 publicIdentifier];
        int v29 = 1;
      }
    }
    NSAppendPrintF();
    id v32 = v7;

    if (v29) {
    if (!peerIdentifier)
    }

    uint64_t v33 = [(RPEndpoint *)v5 idsDeviceIdentifier];
    v34 = (void *)v33;
    if (v33)
    {
      uint64_t v127 = v33;
      NSAppendPrintF();
      id v35 = v32;

      id v32 = v35;
    }

    v116 = [(RPEndpoint *)v5 name];
    NSAppendPrintF();
    id v36 = v32;

    v117 = [(RPEndpoint *)v5 model];
    NSAppendPrintF();
    id v37 = v36;

    v118 = [(RPEndpoint *)v5 accountID];
    NSAppendPrintF();
    id v7 = v37;

    v38 = self->_appID;
    v39 = v38;
    if (v38)
    {
      v118 = v38;
      NSAppendPrintF();
      id v40 = v7;

      id v7 = v40;
    }

    uint64_t v41 = [(RPCompanionLinkDevice *)v5 idsPersonalDeviceIdentifier];
    v42 = (void *)v41;
    if (v41)
    {
      uint64_t v119 = v41;
      NSAppendPrintF();
      id v43 = v7;

      id v7 = v43;
    }

    uint64_t v44 = [(RPCompanionLinkDevice *)v5 homeKitIdentifier];
    v45 = (void *)v44;
    if (v44)
    {
      uint64_t v119 = v44;
      NSAppendPrintF();
      id v46 = v7;

      id v7 = v46;
    }

    uint64_t v47 = [(RPEndpoint *)v5 mediaRemoteIdentifier];
    v48 = (void *)v47;
    if (v47)
    {
      uint64_t v119 = v47;
      NSAppendPrintF();
      id v49 = v7;

      id v7 = v49;
    }

    uint64_t v50 = [(RPEndpoint *)v5 mediaRouteIdentifier];
    v51 = (void *)v50;
    if (v50)
    {
      uint64_t v119 = v50;
      NSAppendPrintF();
      id v52 = v7;

      id v7 = v52;
    }

    uint64_t v53 = [(RPCompanionLinkDevice *)v5 mediaSystemIdentifier];
    v54 = (void *)v53;
    if (v53)
    {
      uint64_t v119 = v53;
      NSAppendPrintF();
      id v55 = v7;

      id v7 = v55;
    }

    uint64_t v56 = [(RPCompanionLinkDevice *)v5 mediaSystemName];
    v57 = (void *)v56;
    if (v56)
    {
      uint64_t v119 = v56;
      NSAppendPrintF();
      id v58 = v7;

      id v7 = v58;
    }

    unsigned int v59 = [(RPCompanionLinkDevice *)v5 mediaSystemRole];
    if (v59)
    {
      if (v59 > 3) {
        v60 = "?";
      }
      else {
        v60 = off_1E605C688[v59 - 1];
      }
      uint64_t v119 = (uint64_t)v60;
      NSAppendPrintF();
      id v61 = v7;

      id v7 = v61;
    }
    unsigned int v62 = [(RPCompanionLinkDevice *)v5 mediaSystemState];
    if (v62)
    {
      if (v62 > 4) {
        v63 = "?";
      }
      else {
        v63 = off_1E605C6A0[v62 - 1];
      }
      v120 = v63;
      NSAppendPrintF();
      id v64 = v7;

      id v7 = v64;
    }
    int v65 = [(RPCompanionLinkDevice *)v5 personalDeviceState];
    if (v65)
    {
      if (v65 >= 8)
      {
        v66 = "-";
        if (v65 > 9) {
          v66 = "U";
        }
      }
      else
      {
        v66 = off_1E605C6C0[v65 - 1];
      }
      uint64_t v121 = (uint64_t)v66;
      NSAppendPrintF();
      id v67 = v7;

      id v7 = v67;
    }
    v68 = self->_peerHomeKitUserIdentifier;
    v69 = v68;
    if (v68)
    {
      uint64_t v121 = (uint64_t)v68;
      NSAppendPrintF();
      id v70 = v7;

      id v7 = v70;
    }

    uint64_t v71 = [(RPCompanionLinkDevice *)v5 publicIdentifier];
    v72 = (void *)v71;
    if (v71)
    {
      uint64_t v121 = v71;
      NSAppendPrintF();
      id v73 = v7;

      id v7 = v73;
    }

    int v74 = [(RPCompanionLinkDevice *)v5 personalRequestsState];
    if (v74)
    {
      if (v74 >= 8)
      {
        v75 = "-";
        if (v74 > 9) {
          v75 = "U";
        }
      }
      else
      {
        v75 = off_1E605C6C0[v74 - 1];
      }
      uint64_t v121 = (uint64_t)v75;
      NSAppendPrintF();
      id v76 = v7;

      id v7 = v76;
    }
    uint64_t v77 = [(RPCompanionLinkDevice *)v5 roomName];
    v78 = (void *)v77;
    if (v77)
    {
      unint64_t controlFlags = v77;
      NSAppendPrintF();
      id v79 = v7;

      id v7 = v79;
    }

    uint64_t v80 = [(RPEndpoint *)v5 verifiedIdentity];
    v81 = (void *)v80;
    if (v80)
    {
      unint64_t controlFlags = v80;
      NSAppendPrintF();
      id v82 = v7;

      id v7 = v82;
    }
  }
  if (a3 <= 20)
  {
    if (self->_controlFlags)
    {
      unint64_t controlFlags = self->_controlFlags;
      v126 = &unk_1B3970C5B;
      NSAppendPrintF();
      id v83 = v7;

      id v7 = v83;
    }
    uint64_t v84 = [(RPCompanionLinkDevice *)v5 deviceColor];
    v85 = (void *)v84;
    if (v84)
    {
      uint64_t v122 = v84;
      NSAppendPrintF();
      id v86 = v7;

      id v7 = v86;
    }

    uint64_t v87 = [(RPCompanionLinkDevice *)v5 deviceCapabilityFlags];
    if (v87)
    {
      uint64_t v122 = v87;
      v128 = &unk_1B3970EE0;
      NSAppendPrintF();
      id v88 = v7;

      id v7 = v88;
    }
    uint64_t v89 = [(RPEndpoint *)v5 serviceTypes];
    v90 = (void *)v89;
    if (v89)
    {
      uint64_t v123 = v89;
      NSAppendPrintF();
      id v91 = v7;

      id v7 = v91;
    }

    v92 = [(RPCompanionLinkDevice *)v5 siriInfo];
    v93 = v92;
    if (v92)
    {
      uint64_t v123 = [v92 count];
      NSAppendPrintF();
      id v94 = v7;

      id v7 = v94;
    }

    uint64_t v95 = [(RPEndpoint *)v5 sourceVersion];
    v96 = (void *)v95;
    if (v95)
    {
      uint64_t v123 = v95;
      NSAppendPrintF();
      id v97 = v7;

      id v7 = v97;
    }

    unsigned int flags = self->_flags;
    if (flags)
    {
      uint64_t v123 = RPCompanionLinkFlagsToShortString(flags, (uint64_t)v136);
      NSAppendPrintF();
      id v99 = v7;

      id v7 = v99;
    }
    unsigned int v100 = [(RPCompanionLinkDevice *)v5 flags];
    if (v100)
    {
      uint64_t v124 = RPCompanionLinkFlagsToShortString(v100, (uint64_t)v136);
      NSAppendPrintF();
      id v101 = v7;

      id v7 = v101;
    }
    uint64_t v102 = [(RPEndpoint *)v5 statusFlags];
    if (v102)
    {
      uint64_t v125 = v102;
      v129 = &unk_1B3970EF6;
      NSAppendPrintF();
      id v103 = v7;

      id v7 = v103;
    }
    v104 = [(RPEndpoint *)v5 verifiedAcl];
    if (v104)
    {
      NSAppendPrintF();
      id v105 = v7;

      id v7 = v105;
    }

    v106 = self->_btPipe;
    if (v106)
    {
      NSAppendPrintF();
      id v107 = v7;

      id v7 = v107;
    }

    v108 = self->_bleConnection;
    if (v108)
    {
      NSAppendPrintF();
      id v109 = v7;

      id v7 = v109;
    }

    v110 = self->_tcpConnection;
    if (v110)
    {
      NSAppendPrintF();
      id v111 = v7;

      id v7 = v111;
    }
  }
  id v112 = v7;

  return v112;
}

- (id)_getCurrentProcessName
{
  appID = self->_appID;
  if (appID)
  {
    v3 = appID;
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F28F80] processInfo];
    v5 = [v4 processName];

    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4F28F80] processInfo];
      v3 = [v6 processName];
    }
    else
    {
      v3 = @"Unknown";
    }
  }
  return v3;
}

- (void)setFlowControlReadEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_flowControlReadEnabled != v3)
  {
    self->_flowControlReadEnabled = v3;
    int var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v3)
    {
      if (!self->_readFrame.readRequested) {
        [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrame requestable:self->_requestable];
      }
      if (self->_btPipeHighPriority && !self->_readFrameBTPipeHighPriority.readRequested)
      {
        -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrameBTPipeHighPriority);
      }
    }
  }
}

- (int)flowControlWriteState
{
  return [(CUTCPConnection *)self->_tcpConnection flowControlState];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (void)setPresent:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_present == v3) {
    return;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_present = v3;
  if (v3)
  {
    probeTimer = self->_probeTimer;
    if (!probeTimer) {
      return;
    }
    v15 = probeTimer;
    dispatch_source_cancel(v15);
    id v7 = self->_probeTimer;
    self->_probeTimer = 0;

    goto LABEL_19;
  }
  if (!self->_tcpConnection)
  {
    int v14 = self->_ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v15 = RPErrorF();
    [(RPConnection *)self _invalidateWithError:v15];
LABEL_19:

    return;
  }
  v8 = self->_probeTimer;
  if (v8)
  {
    v9 = v8;
    dispatch_source_cancel(v9);
    id v10 = self->_probeTimer;
    self->_probeTimer = 0;
  }
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v12 = self->_probeTimer;
  self->_probeTimer = v11;

  v13 = self->_probeTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __27__RPConnection_setPresent___block_invoke;
  handler[3] = &unk_1E605B540;
  handler[4] = self;
  dispatch_source_set_event_handler(v13, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_probeTimer);
}

uint64_t __27__RPConnection_setPresent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    BOOL v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0;
  }
  BOOL v6 = *(void **)(a1 + 32);
  return [v6 sendReachabilityProbe:"not present"];
}

- (void)setTrafficFlags:(unsigned int)a3
{
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_activateCalled)
    {
      dispatchQueue = self->_dispatchQueue;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __32__RPConnection_setTrafficFlags___block_invoke;
      v4[3] = &unk_1E605BCC8;
      v4[4] = self;
      unsigned int v5 = a3;
      dispatch_async(dispatchQueue, v4);
    }
  }
}

uint64_t __32__RPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 776) setTrafficFlags:*(unsigned int *)(a1 + 40)];
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_activateCalled = 1;
  [(RPConnection *)self _updateLinkInfo];
  if (self->_bonjourPeerDevice)
  {
    self->_clientMode = 1;
    -[RPCompanionLinkDevice updateWithBonjourDevice:](self->_peerDeviceInfo, "updateWithBonjourDevice:");
    [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 4];
    int var0 = self->_ucat->var0;
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (self->_destinationString)
  {
    self->_clientMode = 1;
    int v4 = self->_ucat->var0;
    if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (self->_blePeerIdentifier)
  {
    self->_clientMode = 1;
    [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 2];
    int v5 = self->_ucat->var0;
    if (v5 > 30 || v5 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (self->_bleConnection)
  {
    self->_clientMode = 0;
    [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 2];
    objc_storeStrong((id *)&self->_requestable, self->_bleConnection);
    int v6 = self->_ucat->var0;
    if (v6 > 30 || v6 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
  if (self->_btPipe)
  {
    self->_clientMode = GestaltGetDeviceClass() == 6;
    [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x41];
    objc_storeStrong((id *)&self->_requestable, self->_btPipe);
    int v11 = self->_ucat->var0;
    if (v11 > 30 || v11 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
LABEL_31:
    RPDataLinkTypeToString(self->_linkType);
LABEL_20:
    LogPrintF();
LABEL_21:
    identifierOverride = self->_identifierOverride;
    v8 = identifierOverride;
    id v24 = v8;
    if (v8)
    {
      [(RPEndpoint *)self->_peerDeviceInfo setIdentifier:v8];
      objc_storeStrong((id *)&self->_peerIdentifier, identifierOverride);
    }
    else if (self->_peerIdentifier)
    {
      -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:");
    }
    self->_activatedTicks = mach_absolute_time();
    v9 = [(RPConnection *)self _getCurrentProcessName];
    initiator = self->_initiator;
    self->_initiator = v9;

    [(RPConnection *)self _run];

    return;
  }
  if (self->_tcpConnection)
  {
    self->_clientMode = 0;
    int linkType = self->_linkType;
    peerDeviceInfo = self->_peerDeviceInfo;
    uint64_t v14 = [(RPEndpoint *)peerDeviceInfo statusFlags];
    uint64_t v15 = 4;
    if (linkType == 4) {
      uint64_t v15 = 8;
    }
    [(RPEndpoint *)peerDeviceInfo setStatusFlags:v14 | v15];
    objc_storeStrong((id *)&self->_requestable, self->_tcpConnection);
    int v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      unint64_t controlFlags = self->_controlFlags;
      tcpConnection = self->_tcpConnection;
      v23 = RPDataLinkTypeToString(self->_linkType);
      unint64_t v20 = controlFlags;
      id v21 = &unk_1B3970C5B;
      LogPrintF();
    }
    v19 = [(RPEndpoint *)self->_peerDeviceInfo ipAddress];
    if (v19)
    {
    }
    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }
    goto LABEL_21;
  }
  int v18 = self->_ucat->var0;
  if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__RPConnection_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__RPConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__RPConnection_invalidateWithError___block_invoke;
  v7[3] = &unk_1E605B5D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__RPConnection_invalidateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    id v8 = v4;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
      {
        id v7 = v4;
        LogPrintF();
      }
    }
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    [(RPConnection *)self _invalidated];
    id v4 = v8;
  }
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPConnection *)self _invalidateCore:0];
    [(RPConnection *)self _invalidated];
  }
}

- (void)_invalidateCore:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = (NSError *)a3;
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    int v6 = bleConnectTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0;
  }
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    v9 = idleTimer;
    dispatch_source_cancel(v9);
    id v10 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  probeTimer = self->_probeTimer;
  if (probeTimer)
  {
    id v12 = probeTimer;
    dispatch_source_cancel(v12);
    v13 = self->_probeTimer;
    self->_probeTimer = 0;
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    uint64_t v15 = retryTimer;
    dispatch_source_cancel(v15);
    int v16 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    int v18 = startTimer;
    dispatch_source_cancel(v18);
    v19 = self->_startTimer;
    self->_startTimer = 0;
  }
  [(CUBLEConnection *)self->_bleConnection invalidate];
  [(CUTCPConnection *)self->_tcpConnection invalidate];
  unint64_t v20 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_readErrorHandler);
  if (v20)
  {
    if (v4) {
      RPNestedErrorF();
    }
    else {
    id v21 = NSErrorWithOSStatusF();
    }
    ((void (**)(void, void *))v20)[2](v20, v21);
  }
  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    uint64_t v22 = MEMORY[0x1B3EBCC80](self->_hidePasswordHandler);
    v23 = (void *)v22;
    if (v22) {
      (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
    }
  }
  stepError = v4;
  uint64_t v53 = v4;
  if (v4 || (stepError = self->_stepError) != 0)
  {
    uint64_t v25 = stepError;
  }
  else
  {
    RPErrorF();
    uint64_t v25 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
  [(RPConnection *)self _abortRequestsWithError:v25];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v27 = self->_sendArray;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v59 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v34 = [v32 requestID];
          id v35 = (void *)v34;
          if (v34)
          {
            v51 = (void *)v34;
            id v52 = v26;
            LogPrintF();
          }
          else
          {
            v51 = [v32 eventID];
            id v52 = v26;
            LogPrintF();
          }
        }
        id v36 = objc_msgSend(v32, "timer", v51, v52);
        [v32 setTimer:0];
        if (v36) {
          dispatch_source_cancel(v36);
        }
        id v37 = [v32 completion];
        [v32 setCompletion:0];
        if (v37)
        {
          ((void (**)(void, NSError *))v37)[2](v37, v26);
        }
        else
        {
          v38 = [v32 responseHandler];
          [v32 setResponseHandler:0];
          if (v38) {
            ((void (**)(void, void, void, NSError *))v38)[2](v38, 0, 0, v26);
          }
        }
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v29);
  }

  [(NSMutableArray *)self->_sendArray removeAllObjects];
  sendArray = self->_sendArray;
  self->_sendArray = 0;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v40 = self->_receivedMessages;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        int v46 = self->_ucat->var0;
        if (v46 <= 60 && (v46 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v47 = [v45 requestID];
          v48 = (void *)v47;
          if (v47)
          {
            v51 = (void *)v47;
            id v52 = v26;
            LogPrintF();
          }
          else
          {
            v51 = [v45 eventID];
            id v52 = v26;
            LogPrintF();
          }
        }
        objc_msgSend(v45, "responseHandler", v51, v52);
        id v49 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        [v45 setResponseHandler:0];
        if (v49) {
          ((void (**)(void, void, void, NSError *))v49)[2](v49, 0, 0, v26);
        }
      }
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v42);
  }

  [(NSMutableArray *)self->_receivedMessages removeAllObjects];
  receivedMessages = self->_receivedMessages;
  self->_receivedMessages = 0;

  [(RPConnection *)self _logConnectionInvalidatedWithError:v53];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone && !self->_bleConnection && !self->_tcpConnection)
  {
    [(RPConnection *)self _pairSetupInvalidate];
    [(RPConnection *)self _pairVerifyInvalidate];
    startTimer = self->_startTimer;
    if (startTimer)
    {
      id v4 = startTimer;
      dispatch_source_cancel(v4);
      int v5 = self->_startTimer;
      self->_startTimer = 0;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0;

    id configurePairingHandler = self->_configurePairingHandler;
    self->_id configurePairingHandler = 0;

    id flowControlWriteChangedHandler = self->_flowControlWriteChangedHandler;
    self->_id flowControlWriteChangedHandler = 0;

    id homeKitUserIdentifierHandler = self->_homeKitUserIdentifierHandler;
    self->_id homeKitUserIdentifierHandler = 0;

    [(NSMutableSet *)self->_inUseProcesses removeAllObjects];
    inUseProcesses = self->_inUseProcesses;
    self->_inUseProcesses = 0;

    id v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id pairVerifyCompletion = self->_pairVerifyCompletion;
    self->_id pairVerifyCompletion = 0;

    id showPasswordHandler = self->_showPasswordHandler;
    self->_id showPasswordHandler = 0;

    id hidePasswordHandler = self->_hidePasswordHandler;
    self->_id hidePasswordHandler = 0;

    id v17 = self->_homeKitUserIdentifierHandler;
    self->_id homeKitUserIdentifierHandler = 0;

    id promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_id promptForPasswordHandler = 0;

    [(NSMutableArray *)self->_proxyDevices removeAllObjects];
    proxyDevices = self->_proxyDevices;
    self->_proxyDevices = 0;

    id proxyDeviceUpdateHandler = self->_proxyDeviceUpdateHandler;
    self->_id proxyDeviceUpdateHandler = 0;

    id peerUpdatedHandler = self->_peerUpdatedHandler;
    self->_id peerUpdatedHandler = 0;

    id readErrorHandler = self->_readErrorHandler;
    self->_id readErrorHandler = 0;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0;

    id sessionStartHandler = self->_sessionStartHandler;
    self->_id sessionStartHandler = 0;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0;

    self->_invalidateDone = 1;
  }
}

- (void)homeKitIdentityUpdated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_pairVerifyCompleted || (self->_controlFlags & 0x200) != 0 || (self->_flags & 1) != 0) {
    return;
  }
  if ((self->_statusFlags & 0x80000) == 0)
  {
    BOOL v3 = (NSString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(RPConnection *)self _identityProofsAdd:v3 update:1];
    if ([(NSString *)v3 count])
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPConnection *)self sendEncryptedEventID:@"_systemInfoUpdate" event:v3 options:0 completion:0];
    }
    peerHomeKitUserIdentifier = self->_homeKitIdentityIdentifier;
    if (peerHomeKitUserIdentifier)
    {
      homeKitIdentitySignature = self->_homeKitIdentitySignature;
      if (homeKitIdentitySignature)
      {
        uint64_t v14 = peerHomeKitUserIdentifier;
        [(RPConnection *)self _identityProofsVerifyHomeKitSignature:homeKitIdentitySignature identifier:peerHomeKitUserIdentifier];
        peerHomeKitUserIdentifier = v14;
      }
    }
    goto LABEL_22;
  }
  int v5 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
  int v6 = [v5 identifier];

  id v7 = self->_peerHomeKitUserIdentifier;
  id v8 = v6;
  id v13 = v8;
  if (v7 == v8)
  {

    peerHomeKitUserIdentifier = v13;
    BOOL v3 = v13;
LABEL_22:

    id v10 = v3;
    goto LABEL_23;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_16;
  }
  char v9 = [(NSString *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_16:
    BOOL v3 = v13;
    peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
    self->_peerHomeKitUserIdentifier = v3;
    goto LABEL_22;
  }
  id v10 = v13;
LABEL_23:
}

- (void)sameAccountIdentityUpdated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_pairVerifyCompleted
    || (self->_controlFlags & 0x200) != 0
    || (self->_flags & 1) != 0
    || (self->_statusFlags & 0x80000) != 0)
  {
    return;
  }
  BOOL v3 = self->_identityDaemon;
  id v4 = v3;
  if (v3)
  {
    if (self->_identityKeyData && self->_identitySignature)
    {
      int v11 = v3;
      uint64_t v5 = (-[RPIdentityDaemon resolveIdentityTypesForSignature:data:typeFlags:](v3, "resolveIdentityTypesForSignature:data:typeFlags:") << 18) & 0x80000;
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | v5];
      self->_statusFlags |= v5;
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v9 = MEMORY[0x1B3EBCC80](self->_peerUpdatedHandler);
      id v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t))(v9 + 16))(v9);
      }

      goto LABEL_21;
    }
    int v7 = self->_ucat->var0;
    if (v7 <= 30)
    {
      int v11 = v3;
      if (v7 != -1 || (v8 = _LogCategory_Initialize(), id v4 = v11, v8))
      {
        LogPrintF();
LABEL_21:
        id v4 = v11;
      }
    }
  }
}

- (void)_logConnectionInvalidatedWithError:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  uint64_t v5 = UpTicksToSeconds();
  int v6 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifier];
  int v7 = [(RPCompanionLinkDevice *)self->_peerDeviceInfo mediaSystemIdentifier];
  id v8 = v6;
  id v9 = v7;
  id v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_6;
  }
  if ((v8 == 0) == (v9 != 0))
  {
    uint64_t v11 = 0;
    id v13 = v9;
    id v12 = v8;
    goto LABEL_9;
  }
  uint64_t v11 = [v8 isEqual:v9];

  if (v11)
  {
LABEL_6:
    id v12 = [(RPEndpoint *)self->_localDeviceInfo model];
    if (GestaltProductTypeStringToDeviceClass() != 7)
    {
      uint64_t v11 = 0;
      goto LABEL_11;
    }
    id v13 = [(RPEndpoint *)self->_peerDeviceInfo model];
    uint64_t v11 = GestaltProductTypeStringToDeviceClass() == 7;
LABEL_9:

LABEL_11:
  }

  uint64_t v14 = [(RPEndpoint *)self->_localDeviceInfo model];
  int v15 = GestaltProductTypeStringToDeviceClass();
  RPDeviceClassToString(v15);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  int v16 = [(RPEndpoint *)self->_peerDeviceInfo model];
  int v17 = GestaltProductTypeStringToDeviceClass();
  int v18 = RPDeviceClassToString(v17);

  v19 = +[RPConnectionMetrics sharedMetrics];
  LODWORD(v20) = self->_linkType;
  [v19 logConnectionWithDeviceModelFrom:v21 deviceModelTo:v18 error:v4 initiator:self->_initiator isOnDemand:(self->_controlFlags >> 9) & 1 isStereoPair:v11 lifetime:v5 linkType:v20];
}

- (void)_pairSetupInvalidate
{
  mainStream = self->_mainStream;
  self->_mainStream = 0;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0;

  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:0];
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:0];
  [(CUPairingSession *)self->_pairSetupSession invalidate];
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;
}

- (void)_pairVerifyInvalidate
{
  identityKeyData = self->_identityKeyData;
  if (identityKeyData)
  {
    id v4 = [(NSData *)identityKeyData bytes];
    rsize_t v5 = [(NSData *)self->_identityKeyData length];
    if (v4) {
      memset_s(v4, v5, 0, v5);
    }
  }
  identitySignature = self->_identitySignature;
  if (identitySignature)
  {
    int v7 = [(NSData *)identitySignature bytes];
    rsize_t v8 = [(NSData *)self->_identitySignature length];
    if (v7) {
      memset_s(v7, v8, 0, v8);
    }
  }
  homeKitIdentitySignature = self->_homeKitIdentitySignature;
  if (homeKitIdentitySignature)
  {
    id v10 = [(NSData *)homeKitIdentitySignature bytes];
    rsize_t v11 = [(NSData *)self->_homeKitIdentitySignature length];
    if (v10) {
      memset_s(v10, v11, 0, v11);
    }
  }
  id v12 = self->_identityKeyData;
  self->_identityKeyData = 0;

  id v13 = self->_identitySignature;
  self->_identitySignature = 0;

  homeKitIdentityIdentifier = self->_homeKitIdentityIdentifier;
  self->_homeKitIdentityIdentifier = 0;

  int v15 = self->_homeKitIdentitySignature;
  self->_homeKitIdentitySignature = 0;

  identityVerified = self->_identityVerified;
  self->_identityVerified = 0;

  mainStream = self->_mainStream;
  self->_mainStream = 0;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0;

  self->_pairVerifyIdentityType = 0;
  [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:0];
  [(CUPairingSession *)self->_pairVerifySession setSendDataHandler:0];
  [(CUPairingSession *)self->_pairVerifySession invalidate];
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;
}

- (id)_pairVerifySignData:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  rsize_t v8 = self->_forcedSelfIdentity;
  char v9 = [(CUPairingSession *)self->_pairVerifySession peerAppFlags];
  if ((self->_controlFlags & 0x40) != 0 || (v9 & 1) != 0 || v8)
  {
    if (self->_clientMode)
    {
      if (!v8)
      {
LABEL_11:
        rsize_t v11 = [(CUPairingSession *)self->_pairVerifySession copyIdentityHandler];

        if (v11)
        {
          id v12 = [(CUPairingSession *)self->_pairVerifySession copyIdentityHandler];
          id v13 = v12[2](v12, 2, 0);

          if (v13)
          {
            rsize_t v8 = objc_alloc_init(RPIdentity);
            uint64_t v14 = [v13 altIRK];
            [(RPIdentity *)v8 setDeviceIRKData:v14];

            int v15 = [v13 publicKey];
            [(RPIdentity *)v8 setEdPKData:v15];

            int v16 = [v13 secretKey];
            [(RPIdentity *)v8 setEdSKData:v16];

            if (v8) {
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        identityDaemon = self->_identityDaemon;
        id v28 = 0;
        rsize_t v8 = [(RPIdentityDaemon *)identityDaemon identityOfSelfAndReturnError:&v28];
        id v17 = v28;
        if (!v8)
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          if (a5)
          {
            id v17 = v17;
            rsize_t v8 = 0;
            v19 = 0;
            *a5 = v17;
          }
          else
          {
            rsize_t v8 = 0;
            v19 = 0;
          }
          goto LABEL_33;
        }
LABEL_15:
        int v18 = v17;
        id v27 = v17;
        v19 = [(RPIdentity *)v8 signData:v7 error:&v27];
        id v17 = v27;

        if (v19)
        {
          self->_pairVerifyUsedIdentity = 1;
          int v20 = self->_ucat->var0;
          if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v22 = v19;
        }
        else
        {
          int v21 = self->_ucat->var0;
          if (v21 <= 90 && (v21 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          if (a5) {
            *a5 = v17;
          }
        }

LABEL_33:
        goto LABEL_38;
      }
    }
    else
    {
      [(CUPairingSession *)self->_pairVerifySession setSelfAppFlags:[(CUPairingSession *)self->_pairVerifySession selfAppFlags] | 1];
      if (!v8) {
        goto LABEL_11;
      }
    }
LABEL_14:
    id v17 = 0;
    goto LABEL_15;
  }
  int v10 = self->_ucat->var0;
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a5)
  {
    id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-6714 userInfo:0];
    *a5 = v25;
  }
  v19 = 0;
LABEL_38:

  return v19;
}

- (BOOL)_pairVerifyVerifySignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = self->_forcedPeerIdentity;
  char v13 = [(CUPairingSession *)self->_pairVerifySession peerAppFlags];
  unint64_t controlFlags = self->_controlFlags;
  if ((controlFlags & 0x40) != 0 || (v13 & 1) != 0 || v12)
  {
    self->_pairVerifyUsedIdentity = 1;
    if (v12)
    {
      id v16 = 0;
    }
    else
    {
      uint64_t v17 = controlFlags & 0x400000000000;
      if (self->_pairVerifyAuthType != 8 && v17 == 0) {
        uint64_t v19 = 19498;
      }
      else {
        uint64_t v19 = 19458;
      }
      identityDaemon = self->_identityDaemon;
      id v27 = 0;
      id v12 = [(RPIdentityDaemon *)identityDaemon resolveIdentityForSignature:v10 data:v11 typeFlags:v19 error:&v27];
      id v16 = v27;
      if (!v12)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (a6)
        {
          id v16 = v16;
          BOOL v24 = 0;
          id v12 = 0;
          *a6 = v16;
        }
        else
        {
          BOOL v24 = 0;
          id v12 = 0;
        }
        goto LABEL_25;
      }
    }
    objc_storeStrong((id *)&self->_identityKeyData, a4);
    objc_storeStrong((id *)&self->_identitySignature, a3);
    objc_storeStrong((id *)&self->_identityVerified, v12);
    int v21 = [(RPIdentity *)v12 identifier];
    [(RPEndpoint *)self->_peerDeviceInfo setVerifiedIdentity:v21];

    self->_pairVerifyIdentityType = [(RPIdentity *)v12 type];
    int v22 = self->_ucat->var0;
    if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v24 = 1;
LABEL_25:

    goto LABEL_30;
  }
  int v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a6)
  {
    id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-6714 userInfo:0];
    *a6 = v25;
  }
  BOOL v24 = 0;
LABEL_30:

  return v24;
}

- (void)_pskPrepare:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5E1A8]);
  pskData = self->_pskData;
  id v19 = 0;
  char v7 = [v5 prepareWithName:@"main" isClient:v3 pskData:pskData error:&v19];
  id v8 = v19;
  if (v7)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = [v5 authTagLength];
    if (self->_btPipeHighPriority)
    {
      char v9 = (NSError *)objc_alloc_init(MEMORY[0x1E4F5E1A8]);
      id v10 = self->_pskData;
      id v18 = v8;
      char v11 = [(NSError *)v9 prepareWithName:@"hipri" isClient:v3 pskData:v10 error:&v18];
      id v12 = v18;

      if (v11)
      {
        objc_storeStrong((id *)&self->_highPriorityStream, v9);
        self->_highPriorityAuthTagLength = [(NSError *)v9 authTagLength];
      }
      else
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (!self->_stepError)
        {
          RPNestedErrorF();
          id v16 = (NSError *)objc_claimAutoreleasedReturnValue();
          stepError = self->_stepError;
          self->_stepError = v16;
        }
      }
      id v8 = v12;
      goto LABEL_18;
    }
  }
  else
  {
    int v13 = self->_ucat->var0;
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!self->_stepError)
    {
      RPNestedErrorF();
      int v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      char v9 = self->_stepError;
      self->_stepError = v15;
LABEL_18:
    }
  }
}

- (unint64_t)statusFlagsUsingIdentities:(id)a3
{
  return 0;
}

- (void)_run
{
  if (self->_clientMode) {
    [(RPConnection *)self _clientRun];
  }
  else {
    [(RPConnection *)self _serverRun];
  }
}

- (void)sessionStopped:(id)a3
{
}

- (void)tryPassword:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientMode)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_9:
    LogPrintF();
    goto LABEL_13;
  }
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    [(CUPairingSession *)pairSetupSession tryPIN:v7];
    goto LABEL_13;
  }
  int v6 = self->_ucat->var0;
  if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
    goto LABEL_9;
  }
LABEL_13:
}

- (void)_updateExternalState
{
  int internalState = self->_internalState;
  int v4 = internalState == 21 || internalState == 28;
  int state = self->_state;
  if (state != v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int state = v4;
    id stateChangedHandler = self->_stateChangedHandler;
    if (stateChangedHandler)
    {
      char v9 = (void (*)(void))*((void *)stateChangedHandler + 2);
      v9();
    }
  }
}

- (void)_updateLinkInfo
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  tcpConnection = self->_tcpConnection;
  if (tcpConnection)
  {
    [(CUTCPConnection *)tcpConnection peerAddr];
    char v20 = 0;
    SockAddrToString();
    peerAddrString = self->_peerAddrString;
    self->_peerAddrString = 0;

    int v6 = self->_tcpConnection;
    if (v6) {
      [(CUTCPConnection *)v6 selfAddr];
    }
    char v19 = 0;
    SockAddrToString();
  }
  else
  {
    int v4 = self->_peerAddrString;
    self->_peerAddrString = 0;
  }
  selfAddrString = self->_selfAddrString;
  self->_selfAddrString = 0;

  id v8 = self->_tcpConnection;
  if (v8)
  {
    char v9 = [(CUTCPConnection *)v8 netTransportType];
    if ((v9 & 2) != 0) {
      int v10 = 6;
    }
    else {
      int v10 = 3;
    }
    if ((v9 & 8) != 0) {
      int v11 = 8;
    }
    else {
      int v11 = v10;
    }
    if (v9 < 0) {
      int v12 = 5;
    }
    else {
      int v12 = v11;
    }
    if (v9) {
      int v13 = 7;
    }
    else {
      int v13 = v12;
    }
    if ((v9 & 0x10) != 0) {
      int v14 = 9;
    }
    else {
      int v14 = v13;
    }
    if ((v9 & 4) != 0) {
      int v15 = 4;
    }
    else {
      int v15 = v14;
    }
  }
  else if (self->_blePeerIdentifier || self->_bleConnection)
  {
    int v15 = 1;
  }
  else if (self->_btPipe)
  {
    int v15 = 2;
  }
  else
  {
    bonjourPeerDevice = self->_bonjourPeerDevice;
    if (bonjourPeerDevice)
    {
      uint64_t v17 = [(CUBonjourDevice *)bonjourPeerDevice deviceInfo];
      char Int64Ranged = CFDictionaryGetInt64Ranged();

      if ((Int64Ranged & 4) != 0)
      {
        int v15 = 4;
      }
      else if ((Int64Ranged & 0x10) != 0)
      {
        int v15 = 9;
      }
      else if (Int64Ranged)
      {
        int v15 = 7;
      }
      else if (Int64Ranged < 0)
      {
        int v15 = 5;
      }
      else if ((Int64Ranged & 8) != 0)
      {
        int v15 = 8;
      }
      else if ((Int64Ranged & 2) != 0)
      {
        int v15 = 6;
      }
      else
      {
        int v15 = 3;
      }
    }
    else if (self->_destinationString)
    {
      int v15 = 3;
    }
    else
    {
      int v15 = 0;
    }
  }
  if (v15 != self->_linkType) {
    self->_int linkType = v15;
  }
}

- (void)_clientRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unsigned int internalState = self->_internalState;
      switch(internalState)
      {
        case 0u:
          goto LABEL_38;
        case 0xAu:
          self->_unsigned int internalState = 11;
          [(RPConnection *)self _clientConnectStart];
          goto LABEL_64;
        case 0xBu:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          if (self->_preAuthEnabled)
          {
            int v4 = 12;
            goto LABEL_63;
          }
LABEL_12:
          if (!self->_pskData) {
            goto LABEL_62;
          }
          int v4 = 18;
          goto LABEL_63;
        case 0xCu:
          self->_unsigned int internalState = 13;
          [(RPConnection *)self _clientPreAuthStart];
          goto LABEL_64;
        case 0xDu:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (self->_stepDone) {
            goto LABEL_12;
          }
          goto LABEL_64;
        case 0xEu:
          self->_unsigned int internalState = 15;
          [(RPConnection *)self _clientPairSetupStart];
          goto LABEL_64;
        case 0xFu:
          if (!self->_stepError) {
            goto LABEL_39;
          }
          goto LABEL_31;
        case 0x10u:
          self->_unsigned int internalState = 17;
          [(RPConnection *)self _clientPairVerifyStart];
          goto LABEL_64;
        case 0x11u:
          stepError = self->_stepError;
          if (stepError)
          {
            self->_pairVerifyFailed = 1;
            if (self->_pairVerifySession)
            {
              int var0 = self->_ucat->var0;
              if (var0 <= 60)
              {
                if (var0 != -1) {
                  goto LABEL_22;
                }
                if (_LogCategory_Initialize())
                {
                  stepError = self->_stepError;
LABEL_22:
                  char v19 = (const char *)stepError;
                  LogPrintF();
                }
              }
              uint64_t v12 = MEMORY[0x1B3EBCC80](self->_pairVerifyCompletion);
              int v13 = (void *)v12;
              if (v12) {
                (*(void (**)(uint64_t, NSError *))(v12 + 16))(v12, self->_stepError);
              }
            }
            unint64_t controlFlags = self->_controlFlags;
            if (controlFlags & 0x400) != 0 || (controlFlags & 0x8000000000) != 0 || (self->_flags)
            {
              int v16 = self->_ucat->var0;
              if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              int v4 = 14;
            }
            else
            {
              if ((self->_controlFlags & 0x240) != 0x200 || !self->_pairVerifyUsedIdentity)
              {
LABEL_31:
                self->_unsigned int internalState = 22;
                goto LABEL_64;
              }
              int v15 = self->_ucat->var0;
              if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
LABEL_62:
              int v4 = 16;
            }
            goto LABEL_63;
          }
LABEL_39:
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          int v4 = 19;
LABEL_63:
          self->_unsigned int internalState = v4;
LABEL_64:
          unsigned int v17 = self->_internalState;
          if (v17 == internalState) {
            return;
          }
          int v18 = self->_ucat->var0;
          if (v18 > 30) {
            goto LABEL_69;
          }
          if (v18 != -1) {
            goto LABEL_67;
          }
          if (_LogCategory_Initialize())
          {
            unsigned int v17 = self->_internalState;
LABEL_67:
            char v19 = _StateToString(internalState);
            char v20 = _StateToString(v17);
            LogPrintF();
          }
LABEL_69:
          [(RPConnection *)self _updateExternalState];
          break;
        case 0x12u:
          [(RPConnection *)self _pskPrepare:1];
          startTimer = self->_startTimer;
          if (startTimer)
          {
            id v8 = startTimer;
            dispatch_source_cancel(v8);
            char v9 = self->_startTimer;
            self->_startTimer = 0;
          }
          int v4 = 21;
          goto LABEL_63;
        case 0x13u:
          self->_unsigned int internalState = 20;
          [(RPConnection *)self _clientStartSession];
          goto LABEL_64;
        case 0x14u:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          [(RPConnection *)self _clientStarted];
          int v4 = self->_internalState + 1;
          goto LABEL_63;
        case 0x15u:
          if (self->_stepError) {
            goto LABEL_31;
          }
          [(RPConnection *)self _processSends];
          goto LABEL_64;
        case 0x16u:
          if (self->_stepError)
          {
            if (!-[RPConnection _clientError:](self, "_clientError:")) {
              goto LABEL_64;
            }
          }
          else
          {
            int v10 = RPErrorF();
            BOOL v11 = [(RPConnection *)self _clientError:v10];

            if (!v11) {
              goto LABEL_64;
            }
          }
          int v4 = 23;
          goto LABEL_63;
        case 0x17u:
          self->_unsigned int internalState = 24;
          ++self->_retryCount;
          [(RPConnection *)self _clientRetryStart];
          goto LABEL_64;
        case 0x18u:
          if (self->_retryFired)
          {
            self->_retryFired = 0;
LABEL_38:
            self->_unsigned int internalState = 10;
          }
          goto LABEL_64;
        default:
          goto LABEL_64;
      }
    }
  }
}

- (void)_clientConnectStart
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_blePeerIdentifier)
  {
    [(RPConnection *)self _clientConnectStartBLE];
  }
  else if (self->_btPipe)
  {
    [(RPConnection *)self _clientConnectStartBTPipe];
  }
  else
  {
    [(RPConnection *)self _clientConnectStartTCP];
  }
}

- (void)_clientConnectStartBLE
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  [(CUBLEConnection *)self->_bleConnection invalidate];
  id v4 = objc_alloc_init(MEMORY[0x1E4F5E0D0]);
  objc_storeStrong((id *)&self->_bleConnection, v4);
  [v4 setClientBundleID:self->_clientBundleID];
  [v4 setClientUseCase:self->_bleClientUseCase];
  if (self->_bleConnectionPSM) {
    uint64_t bleConnectionPSM = self->_bleConnectionPSM;
  }
  else {
    uint64_t bleConnectionPSM = 129;
  }
  [v4 setDestinationPSM:bleConnectionPSM];
  [v4 setDestinationUUID:self->_blePeerIdentifier];
  [v4 setDispatchQueue:self->_dispatchQueue];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [v4 setLabel:label];
  if (self->_clientBundleID)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = [v4 clientBundleID];
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "clientUseCase"));
      v16 = int v15 = v8;
      LogPrintF();
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__RPConnection__clientConnectStartBLE__block_invoke;
  v20[3] = &unk_1E605B568;
  v20[4] = v4;
  v20[5] = self;
  objc_msgSend(v4, "setErrorHandler:", v20, v15, v16);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_2;
  v19[3] = &unk_1E605B5D8;
  v19[4] = v4;
  v19[5] = self;
  [v4 setInvalidationHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_3;
  v18[3] = &unk_1E605B568;
  v18[4] = v4;
  v18[5] = self;
  [v4 activateWithCompletion:v18];
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    int v10 = bleConnectTimer;
    dispatch_source_cancel(v10);
    BOOL v11 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0;
  }
  uint64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  int v13 = self->_bleConnectTimer;
  self->_bleConnectTimer = v12;

  int v14 = self->_bleConnectTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_4;
  handler[3] = &unk_1E605B540;
  handler[4] = self;
  dispatch_source_set_event_handler(v14, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_bleConnectTimer);
}

void *__38__RPConnection__clientConnectStartBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[59]) {
    return (void *)[result _clientNetworkError:a2 label:"BLE cnx error"];
  }
  return result;
}

uint64_t __38__RPConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 472))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 296);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    id v5 = *(void **)(v1 + 472);
    *(void *)(v1 + 472) = 0;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = 0;

    result = *(void *)(v2 + 40);
    if (*(unsigned char *)(result + 80))
    {
      return [(id)result _invalidated];
    }
  }
  return result;
}

void __38__RPConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 472))
  {
    objc_storeStrong((id *)(v4 + 256), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }
}

void __38__RPConnection__clientConnectStartBLE__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
  id v6 = *(void **)(a1 + 32);
  RPErrorF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _clientConnectCompleted:v7];
}

- (void)_clientConnectStartBTPipe
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RPConnection__clientConnectStartBTPipe__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPConnection__clientConnectStartBTPipe__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientConnectCompleted:0];
}

- (void)_clientConnectStartTCP
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  [(CUTCPConnection *)self->_tcpConnection invalidate];
  id v4 = objc_alloc_init(MEMORY[0x1E4F5E200]);
  objc_storeStrong((id *)&self->_tcpConnection, v4);
  [v4 setConnectTimeoutSecs:30.0];
  [v4 setDataTimeoutSecs:20.0];
  [v4 setDestinationBonjour:self->_bonjourPeerDevice];
  [v4 setDestinationString:self->_destinationString];
  [v4 setDispatchQueue:self->_dispatchQueue];
  unsigned int keepAliveSeconds = self->_keepAliveSeconds;
  if (keepAliveSeconds) {
    uint64_t v6 = keepAliveSeconds;
  }
  else {
    uint64_t v6 = 150;
  }
  [v4 setKeepAliveIdleSeconds:v6];
  [v4 setKeepAliveIntervalSeconds:10];
  [v4 setKeepAliveMaxCount:3];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [v4 setLabel:label];
  [v4 setTrafficFlags:self->_trafficFlags];
  unint64_t controlFlags = self->_controlFlags;
  if (controlFlags) {
    int v9 = 57;
  }
  else {
    int v9 = 41;
  }
  [v4 setFlags:(controlFlags >> 12) & 0x80 | v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__RPConnection__clientConnectStartTCP__block_invoke;
  v13[3] = &unk_1E605B568;
  v13[4] = v4;
  v13[5] = self;
  [v4 setErrorHandler:v13];
  if (self->_flowControlWriteChangedHandler)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_2;
    v12[3] = &unk_1E605B5D8;
    v12[4] = v4;
    v12[5] = self;
    [v4 setFlowControlChangedHandler:v12];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_3;
  v11[3] = &unk_1E605B5D8;
  v11[4] = v4;
  v11[5] = self;
  [v4 setInvalidationHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_4;
  v10[3] = &unk_1E605B568;
  v10[4] = v4;
  v10[5] = self;
  [v4 activateWithCompletion:v10];
}

void *__38__RPConnection__clientConnectStartTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[97]) {
    return (void *)[result _clientNetworkError:a2 label:"TCP cnx error"];
  }
  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 776))
  {
    uint64_t v2 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(v1 + 560));
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

uint64_t __38__RPConnection__clientConnectStartTCP__block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 776))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 296);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    id v5 = *(void **)(v1 + 776);
    *(void *)(v1 + 776) = 0;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = 0;

    result = *(void *)(v2 + 40);
    if (*(unsigned char *)(result + 80))
    {
      return [(id)result _invalidated];
    }
  }
  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 776))
  {
    objc_storeStrong((id *)(v4 + 256), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }
}

- (void)_clientConnectCompleted:(id)a3
{
  id v4 = a3;
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    id v6 = bleConnectTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0;
  }
  if (v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v4;
      LogPrintF();
    }
    if (!self->_stepError)
    {
      RPNestedErrorF();
      unsigned int v17 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v17;
    }
  }
  else
  {
    [(RPConnection *)self _updateLinkInfo];
    if (self->_linkType == 4)
    {
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] & 0xFFFFFFFFFFEFFFE0];
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 8];
    }
    int v9 = [(RPEndpoint *)self->_peerDeviceInfo ipAddress];
    if (v9)
    {
    }
    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }
    startTimer = self->_startTimer;
    if (startTimer)
    {
      BOOL v11 = startTimer;
      dispatch_source_cancel(v11);
      uint64_t v12 = self->_startTimer;
      self->_startTimer = 0;
    }
    int v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    int v14 = self->_startTimer;
    self->_startTimer = v13;

    int v15 = self->_startTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__RPConnection__clientConnectCompleted___block_invoke;
    handler[3] = &unk_1E605B540;
    handler[4] = self;
    dispatch_source_set_event_handler(v15, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_startTimer);
    if (!self->_readFrame.readRequested)
    {
      int v16 = self->_ucat->var0;
      if (v16 <= 40 && (v16 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrame requestable:self->_requestable];
    }
    if (self->_btPipeHighPriority && !self->_readFrameBTPipeHighPriority.readRequested)
    {
      int v19 = self->_ucat->var0;
      if (v19 <= 40 && (v19 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrameBTPipeHighPriority requestable:self->_btPipeHighPriority];
    }
    self->_stepDone = 1;
  }
  [(RPConnection *)self _run];
}

uint64_t __40__RPConnection__clientConnectCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;
  }
  id v6 = *(void **)(a1 + 32);
  if (!v6[18])
  {
    uint64_t v7 = RPErrorF();
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 144);
    *(void *)(v8 + 144) = v7;

    id v6 = *(void **)(a1 + 32);
  }
  return [v6 _run];
}

- (BOOL)_clientError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v24 = v4;
    LogPrintF();
  }
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    uint64_t v7 = bleConnectTimer;
    dispatch_source_cancel(v7);
    uint64_t v8 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0;
  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    int v10 = startTimer;
    dispatch_source_cancel(v10);
    BOOL v11 = self->_startTimer;
    self->_startTimer = 0;
  }
  if (v4)
  {
    [(RPConnection *)self _abortRequestsWithError:v4];
  }
  else
  {
    uint64_t v12 = RPErrorF();
    [(RPConnection *)self _abortRequestsWithError:v12];
  }
  [(CUBLEConnection *)self->_bleConnection invalidate];
  [(CUTCPConnection *)self->_tcpConnection invalidate];
  if (self->_btPipe) {
    [(RPConnection *)self _invalidateCore:v4];
  }
  uint64_t v13 = [v4 code];
  if (v13 == -6776)
  {
    int v14 = self->_ucat->var0;
    if (v14 > 30 || v14 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_46;
    }
    goto LABEL_35;
  }
  if ((self->_controlFlags & 0x200) != 0)
  {
    int v19 = self->_ucat->var0;
    if (v19 > 30 || v19 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_46;
    }
LABEL_35:
    LogPrintF();
LABEL_46:
    [(RPConnection *)self _invalidateWithError:v4];
    BOOL v21 = 0;
    goto LABEL_47;
  }
  bonjourPeerDevice = self->_bonjourPeerDevice;
  if (bonjourPeerDevice)
  {
    uint64_t retryCount = self->_retryCount;
    if ((int)retryCount >= 10)
    {
      uint64_t v17 = v13;
      int v18 = self->_ucat->var0;
      if (v18 > 30) {
        goto LABEL_41;
      }
      if (v18 == -1)
      {
        if (!_LogCategory_Initialize())
        {
LABEL_41:
          if (v17 == -6754
            && ([(RPIdentity *)self->_identityResolved type] == 8
             || [(RPIdentity *)self->_identityResolved type] == 9))
          {
            uint64_t v22 = mach_absolute_time();
            [(RPIdentity *)self->_identityResolved setDisabledUntilTicks:SecondsToUpTicks() + v22];
          }
          [(CUBonjourDevice *)self->_bonjourPeerDevice reconfirm];
          goto LABEL_46;
        }
        uint64_t retryCount = self->_retryCount;
        bonjourPeerDevice = self->_bonjourPeerDevice;
      }
      uint64_t v25 = retryCount;
      v26 = bonjourPeerDevice;
      LogPrintF();
      goto LABEL_41;
    }
  }
  int v20 = self->_ucat->var0;
  if (!self->_present)
  {
    if (v20 > 30 || v20 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_46;
    }
    goto LABEL_35;
  }
  if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v21 = 1;
LABEL_47:

  return v21;
}

- (void)_clientNetworkError:(id)a3 label:(const char *)a4
{
  id v9 = a3;
  if ([v9 code] == -6758)
  {
    [(RPConnection *)self sendReachabilityProbe:"client no ack"];
  }
  else
  {
    if (!self->_stepError)
    {
      uint64_t v8 = a4;
      RPNestedErrorF();
      id v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;
    }
    [(RPConnection *)self _run];
  }
}

- (void)_clientPreAuthStart
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    id v5 = v7;
    if (var0 != -1)
    {
LABEL_3:
      id v6 = v5;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      id v5 = v7;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 10, v7, v6);
}

- (void)_clientPreAuthResponseWithData:(id)a3
{
  id v4 = (void *)OPACKDecodeData();
  if (!v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = self->_ucat->var0;
    if (v7 > 90 || v7 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  int v5 = self->_ucat->var0;
  if (self->_internalState != 13)
  {
    if (v5 > 60 || v5 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepDone = 1;
  [(RPConnection *)self _run];
LABEL_22:
}

- (void)_clientPairSetupStart
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(RPConnection *)self _pairSetupInvalidate];
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  id v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v4;

  [(CUPairingSession *)self->_pairSetupSession setDispatchQueue:self->_dispatchQueue];
  [(CUPairingSession *)self->_pairSetupSession setFlags:self->_pairSetupFlags];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [(CUPairingSession *)self->_pairSetupSession setLabel:label];
  [(CUPairingSession *)self->_pairSetupSession setSessionType:1];
  if ([(NSArray *)self->_allowedMACAddresses count]) {
    [(CUPairingSession *)self->_pairSetupSession setAllowedMACAddresses:self->_allowedMACAddresses];
  }
  if ((self->_controlFlags & 0x1000000000) != 0)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:&unk_1F0C374C8 forKeyedSubscript:@"RPIdentityFeatureFlags"];
    [(CUPairingSession *)self->_pairSetupSession setAdditionalPeerInfo:v8];
  }
  if ([(NSString *)self->_password length])
  {
    password = (__CFString *)self->_password;
    int v10 = self->_pairSetupSession;
LABEL_14:
    [(CUPairingSession *)v10 setFixedPIN:password];
    goto LABEL_16;
  }
  if (!self->_passwordType)
  {
    int v10 = self->_pairSetupSession;
    password = @"public";
    goto LABEL_14;
  }
LABEL_16:
  if (self->_passwordType) {
    [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFFFFFEFLL];
  }
  BOOL v11 = self->_pairSetupACL;
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = v11;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      uint64_t v17 = MEMORY[0x1E4F1CC38];
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 setObject:v17 forKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * v18++)];
        }
        while (v15 != v18);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [(CUPairingSession *)self->_pairSetupSession setAcl:v12];
  }

  uint64_t v19 = MEMORY[0x1B3EBCC80](self->_promptForPasswordHandler);
  int v20 = (void *)v19;
  if (v19)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__RPConnection__clientPairSetupStart__block_invoke;
    v23[3] = &unk_1E605C298;
    v23[4] = self;
    v23[5] = v19;
    [(CUPairingSession *)self->_pairSetupSession setPromptForPINHandler:v23];
  }

  if (self->_pairSetupAuthType == 8)
  {
    if ((self->_controlFlags & 0x800000000000) != 0) {
      [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFBFFFE3];
    }
    [(RPConnection *)self _configureForSessionPairing:self->_pairSetupSession];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37__RPConnection__clientPairSetupStart__block_invoke_2;
  v22[3] = &unk_1E605C2C0;
  v22[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__RPConnection__clientPairSetupStart__block_invoke_3;
  v21[3] = &unk_1E605B5B0;
  v21[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:v21];
  [(CUPairingSession *)self->_pairSetupSession activate];
}

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _clientPairSetupPromptWithFlags:a2 throttleSeconds:a3 handler:*(void *)(a1 + 40)];
}

void __37__RPConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  int v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v11 = objc_alloc_init(v5);
  [v11 setObject:v6 forKeyedSubscript:@"_pd"];

  int v7 = *(_DWORD **)(a1 + 32);
  if (v7[50] == 8)
  {
    id v8 = [NSNumber numberWithInt:8];
    [v11 setObject:v8 forKeyedSubscript:@"_auTy"];

    int v7 = *(_DWORD **)(a1 + 32);
  }
  if (v7[86])
  {
    id v9 = objc_msgSend(NSNumber, "numberWithInt:");
    [v11 setObject:v9 forKeyedSubscript:@"_pwTy"];

    int v7 = *(_DWORD **)(a1 + 32);
  }
  if (a2) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 4;
  }
  [v7 _sendFrameType:v10 unencryptedObject:v11];
}

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientPairSetupCompleted:a2];
}

- (void)_clientPairSetupWithData:(id)a3
{
  id v4 = a3;
  if (self->_pairSetupSession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = (void *)[v4 length];
      LogPrintF();
    }
    id v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      id v10 = RPErrorF();
      id v8 = 0;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (CFDictionaryGetInt64Ranged())
      {
        CFStringGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue();
        uint64_t v13 = &stru_1F0C22DA8;
        if (TypedValue) {
          uint64_t v13 = (__CFString *)TypedValue;
        }
        uint64_t v15 = v13;
      }
      else
      {
        CFDataGetTypeID();
        uint64_t v7 = CFDictionaryGetTypedValue();
        if (v7)
        {
          id v8 = (void *)v7;
          [(CUPairingSession *)self->_pairSetupSession receivedData:v7];
LABEL_11:
          id v9 = 0;
          goto LABEL_12;
        }
      }
      id v9 = RPErrorF();
    }
    else
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v11);
      id v9 = RPErrorF();
    }
  }
  else
  {
    id v9 = RPErrorF();
    id v6 = 0;
  }
  if (v9)
  {
    int v14 = self->_ucat->var0;
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v9);
    }
    else
    {
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v15);
    }
  }
  id v8 = 0;
LABEL_12:
}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  pairSetupSession = self->_pairSetupSession;
  id v11 = (void (**)(id, uint64_t, uint64_t))a5;
  unsigned int v9 = [(CUPairingSession *)pairSetupSession pinTypeActual] - 1;
  if (v9 > 7) {
    int v10 = 0;
  }
  else {
    int v10 = dword_1B397116C[v9];
  }
  self->_passwordTypeActual = v10;
  v11[2](v11, v6, v5);
}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    pairSetupSession = self->_pairSetupSession;
    id v23 = 0;
    uint64_t v7 = [(CUPairingSession *)pairSetupSession openStreamWithName:@"main" error:&v23];
    id v8 = v23;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    int v10 = self->_mainStream;
    if (!v10)
    {
      id v13 = v8;
      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_16;
    }
    self->_mainAuthTagLength = [(CUPairingStream *)v10 authTagLength];
    if (self->_btPipeHighPriority)
    {
      id v11 = self->_pairSetupSession;
      id v22 = v8;
      id v12 = [(CUPairingSession *)v11 openStreamWithName:@"hipri" error:&v22];
      id v13 = v22;

      highPriorityStream = self->_highPriorityStream;
      self->_highPriorityStream = v12;

      uint64_t v15 = self->_highPriorityStream;
      if (!v15) {
        goto LABEL_15;
      }
      self->_highPriorityAuthTagLength = [(CUPairingStream *)v15 authTagLength];
    }
    else
    {
      id v13 = v8;
    }
    self->_statusFlags &= 0xFFFFFFEFFFF51FFFLL;
    if (([(CUPairingSession *)self->_pairSetupSession flags] & 0x10) != 0)
    {
      unsigned int v16 = self->_flags | 1;
    }
    else
    {
      self->_statusFlags |= 0x8000uLL;
      unsigned int v16 = self->_flags & 0xFFFFFFFE;
    }
    self->_unsigned int flags = v16;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_stepDone = 1;
LABEL_15:
    if (!v13) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  id v13 = v4;
LABEL_16:
  int v18 = self->_ucat->var0;
  if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v13;
    LogPrintF();
  }
  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v13);
  }
  [(RPConnection *)self _pairSetupInvalidate];
LABEL_23:
  uint64_t v19 = MEMORY[0x1B3EBCC80](self->_authCompletionHandler);
  int v20 = (void *)v19;
  if (v19) {
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v13);
  }

  [(RPConnection *)self _run];
}

- (void)_clientPairVerifyStart
{
  v33[1] = *MEMORY[0x1E4F143B8];
  [(RPConnection *)self _pairVerifyInvalidate];
  self->_pairVerifyCompleted = 0;
  self->_pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  id v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = v4;

  [(CUPairingSession *)self->_pairVerifySession setDispatchQueue:self->_dispatchQueue];
  [(CUPairingSession *)self->_pairVerifySession setFlags:self->_pairVerifyFlags];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [(CUPairingSession *)self->_pairVerifySession setLabel:label];
  [(CUPairingSession *)self->_pairVerifySession setSessionType:3];
  unint64_t controlFlags = self->_controlFlags;
  if ((controlFlags & 0x20000000) != 0)
  {
    id v32 = @"_cf";
    id v8 = [NSNumber numberWithUnsignedLongLong:controlFlags & 0x20000000];
    v33[0] = v8;
    unsigned int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    [(CUPairingSession *)self->_pairVerifySession setAppInfoSelf:v9];

    unint64_t controlFlags = self->_controlFlags;
  }
  self->_unsigned int pairVerifyAuthType = 0;
  uint64_t passwordType = self->_passwordType;
  int preferredIdentityType = self->_preferredIdentityType;
  if (preferredIdentityType == 2)
  {
    if ((controlFlags & 0xC00000000000) != 0)
    {
LABEL_8:
      self->_unsigned int pairVerifyAuthType = 8;
      self->_pairSetupAuthType = 8;
      [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFE3];
LABEL_9:
      [(CUPairingSession *)self->_pairVerifySession setSelfAppFlags:1];
      goto LABEL_32;
    }
  }
  else
  {
    if ((controlFlags & 0x8000000) != 0)
    {
      unsigned int pairVerifyAuthType = 2;
      self->_unsigned int pairVerifyAuthType = 2;
LABEL_37:
      GestaltGetDeviceClass();
      goto LABEL_41;
    }
    switch(preferredIdentityType)
    {
      case 13:
        goto LABEL_8;
      case 9:
        self->_unsigned int pairVerifyAuthType = 3;
        [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
        id v13 = self->_pairVerifySession;
        uint64_t v14 = [(CUPairingSession *)v13 flags] | 0x4000000;
        goto LABEL_31;
      case 8:
        goto LABEL_29;
    }
    if ((controlFlags & 0xC00000000000) != 0) {
      goto LABEL_8;
    }
    if (preferredIdentityType == 15 && self->_configurePairingHandler)
    {
      self->_unsigned int pairVerifyAuthType = 9;
      [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
      [(CUPairingSession *)self->_pairVerifySession setSelfAppFlags:1];
      (*((void (**)(void))self->_configurePairingHandler + 2))();
      goto LABEL_32;
    }
  }
  if (((controlFlags & 0x400) != 0 || (self->_flags & 1) != 0 || (controlFlags & 0x8000000000) != 0)
    && passwordType)
  {
    if (passwordType == 4)
    {
      self->_unsigned int pairVerifyAuthType = 7;
      [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
      id v13 = self->_pairVerifySession;
      uint64_t v14 = [(CUPairingSession *)v13 flags] | 0x1000;
LABEL_31:
      [(CUPairingSession *)v13 setFlags:v14];
      goto LABEL_32;
    }
    if ((passwordType - 1) > 1) {
      goto LABEL_32;
    }
LABEL_29:
    self->_unsigned int pairVerifyAuthType = 4;
    [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
    id v13 = self->_pairVerifySession;
    uint64_t v14 = [(CUPairingSession *)v13 flags] | 0xC;
    goto LABEL_31;
  }
  if ((controlFlags & 0x40) != 0 || !self->_pairVerifyFailed) {
    goto LABEL_9;
  }
LABEL_32:
  unsigned int pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType != 8) {
    goto LABEL_37;
  }
  [(RPConnection *)self _configureForSessionPairing:self->_pairVerifySession];
  if (GestaltGetDeviceClass() == 4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = "SessionPaired";
      id v21 = "RPIdentity";
      LogPrintF();
    }
    unsigned int pairVerifyAuthType = 1;
  }
  else
  {
    unsigned int pairVerifyAuthType = 8;
  }
LABEL_41:
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __38__RPConnection__clientPairVerifyStart__block_invoke;
  v30[3] = &unk_1E605C2E8;
  unsigned int v31 = pairVerifyAuthType;
  v30[4] = self;
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", v30, v19, v21);
  if (pairVerifyAuthType > 7 || ((1 << pairVerifyAuthType) & 0x98) == 0)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_2;
    v29[3] = &unk_1E605C310;
    v29[4] = self;
    [(CUPairingSession *)self->_pairVerifySession setSignDataHandler:v29];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_3;
    v28[3] = &unk_1E605C338;
    v28[4] = self;
    [(CUPairingSession *)self->_pairVerifySession setVerifySignatureHandler:v28];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_4;
  v27[3] = &unk_1E605B5B0;
  v27[4] = self;
  [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:v27];
  int v16 = self->_ucat->var0;
  if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
  {
    if (pairVerifyAuthType > 0xA) {
      uint64_t v17 = "?";
    }
    else {
      uint64_t v17 = off_1E605C8D0[pairVerifyAuthType];
    }
    if (passwordType > 0xB) {
      int v18 = "?";
    }
    else {
      int v18 = off_1E605C870[passwordType];
    }
    long long v25 = &unk_1B39710C3;
    long long v26 = v18;
    id v23 = &unk_1B3970C5B;
    uint64_t flags = self->_flags;
    int v20 = v17;
    unint64_t v22 = self->_controlFlags;
    LogPrintF();
  }
  [(CUPairingSession *)self->_pairVerifySession activate];
}

void __38__RPConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a2)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:");
      [v5 setObject:v7 forKeyedSubscript:@"_auTy"];
    }
    uint64_t v6 = 5;
  }
  else
  {
    uint64_t v6 = 6;
  }
  [v5 setObject:v8 forKeyedSubscript:@"_pd"];
  [*(id *)(a1 + 32) _sendFrameType:v6 unencryptedObject:v5];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _pairVerifySignData:a3 flags:a2 error:a4];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _pairVerifyVerifySignature:a4 data:a3 flags:a2 error:a5];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientPairVerifyCompleted:a2];
}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4 = a3;
  if (self->_pairVerifySession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = (void *)[v4 length];
      LogPrintF();
    }
    uint64_t v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      id v10 = RPErrorF();
      id v8 = 0;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFDataGetTypeID();
      uint64_t v7 = CFDictionaryGetTypedValue();
      if (v7)
      {
        id v8 = (void *)v7;
        [(CUPairingSession *)self->_pairVerifySession receivedData:v7];
LABEL_10:
        unsigned int v9 = 0;
        goto LABEL_11;
      }
      unsigned int v9 = RPErrorF();
    }
    else
    {
      id v11 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v11);
      unsigned int v9 = RPErrorF();
    }
  }
  else
  {
    unsigned int v9 = RPErrorF();
    uint64_t v6 = 0;
  }
  if (v9)
  {
    int v12 = self->_ucat->var0;
    if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v9);
    }
    else
    {
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v13);
    }
  }
  id v8 = 0;
LABEL_11:
}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && ([(CUPairingSession *)self->_pairVerifySession appInfoPeer],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int Int64 = CFDictionaryGetInt64(),
          v7,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      id v70 = 0;
      uint64_t v17 = [(CUPairingSession *)pairVerifySession openStreamWithName:@"main" type:2 error:&v70];
      id v11 = v70;
      mainStream = self->_mainStream;
      self->_mainStream = v17;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      uint64_t v19 = self->_pairVerifySession;
      id v69 = v11;
      uint64_t v14 = [(CUPairingSession *)v19 openStreamWithName:@"hipri" type:2 error:&v69];
      uint64_t v15 = v69;
    }
    else
    {
      unsigned int v9 = self->_pairVerifySession;
      id v68 = 0;
      id v10 = [(CUPairingSession *)v9 openStreamWithName:@"main" error:&v68];
      id v11 = v68;
      int v12 = self->_mainStream;
      self->_mainStream = v10;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      id v13 = self->_pairVerifySession;
      id v67 = v11;
      uint64_t v14 = [(CUPairingSession *)v13 openStreamWithName:@"hipri" error:&v67];
      uint64_t v15 = v67;
    }
    id v20 = v15;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v14;

    unint64_t v22 = self->_highPriorityStream;
    id v11 = v20;
    if (!v22) {
      goto LABEL_52;
    }
    self->_highPriorityAuthTagLength = [(CUPairingStream *)v22 authTagLength];
    id v11 = v20;
LABEL_10:
    id v23 = self->_mainStream;
    if (v23)
    {
      self->_mainAuthTagLength = [(CUPairingStream *)v23 authTagLength];
      self->_pairVerifyCompleted = 1;
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] & 0xFFFFFF8FFFF50FFFLL];
      unint64_t v24 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_unint64_t statusFlags = v24;
      int pairVerifyAuthType = self->_pairVerifyAuthType;
      long long v26 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x80000];
              unint64_t v24 = self->_statusFlags | 0x80000;
              self->_unint64_t statusFlags = v24;
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v28 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x4000];
              unint64_t v39 = self->_statusFlags | 0x4000;
              self->_unint64_t statusFlags = v39;
              long long v26 = "(RPI-Family)";
              if ((v39 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 6:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x20000];
              unint64_t v40 = self->_statusFlags | 0x20000;
              self->_unint64_t statusFlags = v40;
              long long v26 = "(RPI-Friend)";
              if ((v40 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xC:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x1000000000];
              unint64_t v41 = self->_statusFlags | 0x1000000000;
              self->_unint64_t statusFlags = v41;
              long long v26 = "(RPI-SharedTVUser)";
              if ((v41 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xD:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x2000000000];
              unint64_t v42 = self->_statusFlags | 0x2000000000;
              self->_unint64_t statusFlags = v42;
              long long v26 = "(RPI-SessionPaired)";
              if ((v42 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xF:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x4000000000];
              unint64_t v43 = self->_statusFlags | 0x4000000000;
              self->_unint64_t statusFlags = v43;
              long long v26 = "(RPI-AdHocPaired)";
              if ((v43 & 0x80000) != 0) {
                goto LABEL_36;
              }
              goto LABEL_39;
            default:
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v28 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity) {
                long long v26 = v28;
              }
              else {
                long long v26 = "(HK)";
              }
              if ((v24 & 0x80000) == 0) {
                goto LABEL_39;
              }
LABEL_36:
              uint64_t v44 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
              v45 = [v44 identifier];
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v45;

              break;
          }
          goto LABEL_39;
        case 3:
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x2000];
          self->_statusFlags |= 0x2000uLL;
          uint64_t v29 = [(CUPairingSession *)self->_pairVerifySession pairedPeer];
          uint64_t v30 = [v29 identifier];
          unsigned int v31 = [v30 UUIDString];
          id v32 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v31;

          long long v26 = "HKShared";
          goto LABEL_39;
        case 4:
          uint64_t v33 = [(CUPairingSession *)self->_pairVerifySession aclActual];
          uint64_t v34 = CFDictionaryGetInt64();

          if (v34)
          {
            id v35 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
            id v36 = [v35 identifier];
            id v37 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v36;

            uint64_t v38 = 557056;
          }
          else
          {
            uint64_t v38 = 0x8000;
          }
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | v38];
          self->_statusFlags |= v38;
          long long v26 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            uint64_t v47 = [(CUPairingSession *)self->_pairVerifySession pairedPeer];
            if (v47)
            {
              v48 = objc_alloc_init(RPIdentity);
              id v49 = [v47 publicKey];
              [(RPIdentity *)v48 setEdPKData:v49];

              uint64_t v50 = [v47 identifier];
              v51 = [v50 UUIDString];
              [(RPIdentity *)v48 setIdentifier:v51];

              [(RPIdentity *)v48 setType:8];
              identityVerified = self->_identityVerified;
              self->_identityVerified = v48;
              uint64_t v53 = v48;

              long long v54 = [(RPIdentity *)self->_identityVerified identifier];
              [(RPEndpoint *)self->_peerDeviceInfo setVerifiedIdentity:v54];
            }
          }
          break;
        case 5:
          break;
        case 6:
          long long v26 = "PSGuest";
          break;
        case 7:
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x20000];
          self->_statusFlags |= 0x20000uLL;
          long long v26 = "PV-AID";
          break;
        case 10:
          long long v26 = "AuthEnd";
          break;
        default:
          long long v26 = "?";
          break;
      }
      self->_stepDone = 1;
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        int v65 = &unk_1B3970EF6;
        v66 = self->_identityVerified;
        v63 = &unk_1B39710C3;
        unint64_t statusFlags = self->_statusFlags;
        long long v61 = v26;
        uint64_t flags = self->_flags;
        LogPrintF();
      }
      uint64_t v56 = MEMORY[0x1B3EBCC80](self->_authCompletionHandler);
      long long v57 = (void *)v56;
      if (v56 && pairVerifyAuthType) {
        (*(void (**)(uint64_t, void))(v56 + 16))(v56, 0);
      }
    }
LABEL_52:
    self->_pairVerifyFailed = v11 != 0;
    if (!v11) {
      goto LABEL_60;
    }
    goto LABEL_53;
  }
  id v11 = v5;
  self->_pairVerifyFailed = 1;
LABEL_53:
  int v58 = self->_ucat->var0;
  if (v58 <= 60 && (v58 != -1 || _LogCategory_Initialize()))
  {
    long long v61 = (const char *)v11;
    LogPrintF();
  }
  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, a3);
  }
  [(RPConnection *)self _pairVerifyInvalidate];
LABEL_60:
  uint64_t v59 = MEMORY[0x1B3EBCC80](self->_pairVerifyCompletion);
  long long v60 = (void *)v59;
  if (v59) {
    (*(void (**)(uint64_t, id))(v59 + 16))(v59, v11);
  }

  [(RPConnection *)self _run];
}

- (void)_clientStartSession
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  id v4 = [(RPConnection *)self _systeminfo];
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v9 = v4;
    LogPrintF();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__RPConnection__clientStartSession__block_invoke;
  v10[3] = &unk_1E605C360;
  v10[4] = self;
  [(RPConnection *)self _sendEncryptedRequestID:@"_systemInfo", v4, 0, 0, 0, v10, v9 request xpcID options sendEntry responseHandler];
  unint64_t v6 = self->_statusFlags & 0x10000AE000;
  uint64_t v7 = MEMORY[0x1B3EBCC80](self->_proxyDeviceUpdateHandler);
  id v8 = (void *)v7;
  if (v6 && v7) {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

void __35__RPConnection__clientStartSession__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11)
  {
    char v9 = [*(id *)(a1 + 32) _receivedSystemInfo:v11 xid:0];
    if (!v8 && (v9 & 1) == 0)
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v8)
  {
    id v10 = RPNestedErrorF();
  }
  else
  {
    id v10 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), v10);
  if (v8) {

  }
  *(unsigned char *)(*(void *)(a1 + 32) + 140) = 1;
  [*(id *)(a1 + 32) _run];
}

- (void)_clientRetryStart
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v4 = retryTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  uint64_t v6 = mach_absolute_time();
  if (self->_retryTicks)
  {
    UpTicksToSecondsF();
    double v8 = v7;
  }
  else
  {
    double v8 = -1.0;
  }
  self->_retryTicks = v6;
  if (v8 >= 10.0 || v8 < 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 10.0 - v8;
  }
  int var0 = self->_ucat->var0;
  if (v10 <= 0.0)
  {
    if (v8 < 0.0)
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
    }
    else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }
    LogPrintF();
LABEL_28:
    self->_retryFired = 1;
    return;
  }
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_retryFired = 0;
  int v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v13 = self->_retryTimer;
  self->_retryTimer = v12;

  uint64_t v14 = self->_retryTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__RPConnection__clientRetryStart__block_invoke;
  handler[3] = &unk_1E605B540;
  handler[4] = self;
  dispatch_source_set_event_handler(v14, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_retryTimer);
}

uint64_t __33__RPConnection__clientRetryStart__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112) = mach_absolute_time();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _clientRetryFired];
}

- (void)_clientRetryFired
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v4 = retryTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  if (self->_present)
  {
    self->_retryFired = 1;
    [(RPConnection *)self _run];
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    RPErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(RPConnection *)self _invalidateWithError:v7];
  }
}

- (void)_clientStarted
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v4 = startTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_startTimer;
    self->_startTimer = 0;
  }
  self->_uint64_t retryCount = 0;
}

- (void)_serverRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unsigned int internalState = self->_internalState;
      switch(internalState)
      {
        case 0x19u:
          self->_unsigned int internalState = 26;
          [(RPConnection *)self _serverAccept];
          if (self->_pskData)
          {
            [(RPConnection *)self _pskPrepare:0];
            [(RPConnection *)self _serverStarted];
            self->_unsigned int internalState = 28;
          }
          break;
        case 0x1Au:
          if (self->_stepError) {
            goto LABEL_16;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            int v4 = 27;
            goto LABEL_14;
          }
          break;
        case 0x1Bu:
          if (self->_stepError) {
            goto LABEL_16;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            [(RPConnection *)self _serverStarted];
            int v4 = self->_internalState + 1;
LABEL_14:
            self->_unsigned int internalState = v4;
          }
          break;
        case 0x1Cu:
          if (self->_stepError) {
LABEL_16:
          }
            self->_unsigned int internalState = 29;
          else {
            [(RPConnection *)self _processSends];
          }
          break;
        case 0x1Du:
          goto LABEL_7;
        default:
          if (!internalState) {
LABEL_7:
          }
            self->_unsigned int internalState = 25;
          break;
      }
      unsigned int v5 = self->_internalState;
      if (v5 == internalState) {
        return;
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1) {
          goto LABEL_20;
        }
        if (_LogCategory_Initialize()) {
          break;
        }
      }
LABEL_22:
      [(RPConnection *)self _updateExternalState];
    }
    unsigned int v5 = self->_internalState;
LABEL_20:
    id v7 = _StateToString(internalState);
    double v8 = _StateToString(v5);
    LogPrintF();
    goto LABEL_22;
  }
}

- (void)_serverAccept
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    int v4 = startTimer;
    dispatch_source_cancel(v4);
    unsigned int v5 = self->_startTimer;
    self->_startTimer = 0;
  }
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v7 = self->_startTimer;
  self->_startTimer = v6;

  double v8 = self->_startTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__RPConnection__serverAccept__block_invoke;
  handler[3] = &unk_1E605B540;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_startTimer);
  [(RPConnection *)self _pairSetupInvalidate];
  [(RPConnection *)self _pairVerifyInvalidate];
  self->_pairVerifyCompleted = 0;
  self->_BOOL pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  [(RPConnection *)self _updateLinkInfo];
  if (self->_bleConnection)
  {
    [(RPConnection *)self _serverAcceptBLE];
  }
  else if (self->_btPipe)
  {
    [(RPConnection *)self _serverAcceptBTPipe];
  }
  else
  {
    [(RPConnection *)self _serverAcceptTCP];
  }
}

void __29__RPConnection__serverAccept__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned int v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  RPErrorF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _serverError:v7];
}

- (void)_serverAcceptBLE
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__RPConnection__serverAcceptBLE__block_invoke;
  v4[3] = &unk_1E605B5B0;
  v4[4] = self;
  [(CUBLEConnection *)self->_bleConnection setErrorHandler:v4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__RPConnection__serverAcceptBLE__block_invoke_2;
  v3[3] = &unk_1E605B540;
  v3[4] = self;
  [(CUBLEConnection *)self->_bleConnection setInvalidationHandler:v3];
  [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrame requestable:self->_requestable];
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverNetworkError:a2 label:"BLE cnx error"];
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 296);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  unsigned int v5 = *(void **)(v2 + 472);
  *(void *)(v2 + 472) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = 0;

  double v8 = *(void **)(a1 + 32);
  return [v8 _invalidated];
}

- (void)_serverAcceptBTPipe
{
  if (!self->_readFrame.readRequested)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrame requestable:self->_requestable];
  }
  if (!self->_readFrameBTPipeHighPriority.readRequested)
  {
    int v4 = self->_ucat->var0;
    if (v4 <= 40 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    btPipeHighPriority = self->_btPipeHighPriority;
    [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrameBTPipeHighPriority requestable:btPipeHighPriority];
  }
}

- (void)_serverAcceptTCP
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__RPConnection__serverAcceptTCP__block_invoke;
  v5[3] = &unk_1E605B5B0;
  v5[4] = self;
  [(CUTCPConnection *)self->_tcpConnection setErrorHandler:v5];
  if (self->_flowControlWriteChangedHandler)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __32__RPConnection__serverAcceptTCP__block_invoke_2;
    v4[3] = &unk_1E605B540;
    v4[4] = self;
    [(CUTCPConnection *)self->_tcpConnection setFlowControlChangedHandler:v4];
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__RPConnection__serverAcceptTCP__block_invoke_3;
  v3[3] = &unk_1E605B540;
  v3[4] = self;
  [(CUTCPConnection *)self->_tcpConnection setInvalidationHandler:v3];
  [(RPConnection *)self _receiveStart:0 readFrame:&self->_readFrame requestable:self->_requestable];
}

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverNetworkError:a2 label:"TCP cnx error"];
}

void __32__RPConnection__serverAcceptTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 776))
  {
    uint64_t v2 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(v1 + 560));
    if (v2)
    {
      int v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 296);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  unsigned int v5 = *(void **)(v2 + 776);
  *(void *)(v2 + 776) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = 0;

  double v8 = *(void **)(a1 + 32);
  return [v8 _invalidated];
}

- (void)_serverError:(id)a3
{
  id v5 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v5;
  if (var0 <= 60)
  {
    if (var0 != -1 || (int v7 = _LogCategory_Initialize(), v5 = v9, v7))
    {
      id v8 = v5;
      LogPrintF();
      id v5 = v9;
    }
  }
  if (self->_btPipe)
  {
    [(RPConnection *)self _invalidateCore:v5];
    if (!self->_stepError) {
      objc_storeStrong((id *)&self->_stepError, a3);
    }
    [(RPConnection *)self _run];
  }
  else
  {
    [(RPConnection *)self _invalidateWithError:v5];
  }
}

- (void)_serverNetworkError:(id)a3 label:(const char *)a4
{
  id v8 = a3;
  if ([v8 code] == -6758)
  {
    [(RPConnection *)self sendReachabilityProbe:"server no ack"];
  }
  else
  {
    int v7 = a4;
    uint64_t v6 = RPNestedErrorF();
    -[RPConnection _serverError:](self, "_serverError:", v6, v7);
  }
}

- (void)_serverPreAuthRequestWithData:(id)a3
{
  int v4 = (void *)OPACKDecodeData();
  if (!v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_22;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v6 = self->_ucat->var0;
  if ((isKindOfClass & 1) == 0)
  {
    if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_11;
  }
  if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v4;
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  int v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v8;
    LogPrintF();
  }
  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 11, v8, v10);

LABEL_22:
}

- (BOOL)_serverPairingAllowed
{
  uint64_t v2 = [(Class)getMCProfileConnectionClass[0]() sharedConnection];
  int v3 = getMCFeatureRemoteAppPairingAllowed[0]();
  int v4 = [v2 effectiveBoolValueForSetting:v3];

  return v4 != 2;
}

- (void)_serverPairSetupWithData:(id)a3 start:(BOOL)a4
{
  v64[2] = *MEMORY[0x1E4F143B8];
  int v59 = 0;
  int v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    id v45 = RPErrorF();
    goto LABEL_93;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v46 = (objc_class *)objc_opt_class();
    id v49 = NSStringFromClass(v46);
    uint64_t v44 = RPErrorF();

    goto LABEL_98;
  }
  int passwordType = self->_passwordType;
  if (!passwordType)
  {
    if (([(RPCompanionLinkDevice *)self->_localDeviceInfo flags] & 8) != 0) {
      goto LABEL_7;
    }
    int passwordType = self->_passwordType;
  }
  if (passwordType != 3)
  {
    if ((self->_flags & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_7:
  if ((self->_flags & 0x4000) == 0)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v63[0] = @"_ec";
    v63[1] = @"_em";
    v64[0] = &unk_1F0C374E0;
    v64[1] = @"Non-home access not allowed";
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = v64;
    id v21 = v63;
LABEL_37:
    unint64_t v22 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:2];
    [(RPConnection *)self _sendFrameType:4 unencryptedObject:v22];
LABEL_92:

LABEL_93:
    uint64_t v44 = 0;
    goto LABEL_94;
  }
LABEL_12:
  int v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_16:
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  unsigned int v11 = Int64Ranged;
  if (Int64Ranged <= 0xA
    && ((1 << Int64Ranged) & 0x426) != 0
    && ![(RPConnection *)self _serverPairingAllowed])
  {
    int v18 = self->_ucat->var0;
    if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v61[0] = @"_ec";
    v61[1] = @"_em";
    v62[0] = &unk_1F0C374E0;
    v62[1] = @"Pairing not allowed";
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = v62;
    id v21 = v61;
    goto LABEL_37;
  }
  if (!a4 && self->_pairSetupSession) {
    goto LABEL_88;
  }
  [(RPConnection *)self _pairSetupInvalidate];
  int v12 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v12;

  [(CUPairingSession *)self->_pairSetupSession setDispatchQueue:self->_dispatchQueue];
  [(CUPairingSession *)self->_pairSetupSession setFlags:self->_pairSetupFlags];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [(CUPairingSession *)self->_pairSetupSession setLabel:label];
  [(CUPairingSession *)self->_pairSetupSession setSessionType:2];
  unsigned int v15 = CFDictionaryGetInt64Ranged();
  int DeviceClass = GestaltGetDeviceClass();
  if (v11 == 10 && DeviceClass == 4 && !v15)
  {
    int v17 = self->_ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    {
      v48 = "Invalid";
      uint64_t v50 = "SessionPaired";
      LogPrintF();
    }
    unsigned int v15 = 8;
  }
  int v23 = self->_ucat->var0;
  if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
  {
    if (v11 > 0xB) {
      unint64_t v24 = "?";
    }
    else {
      unint64_t v24 = off_1E605C870[v11];
    }
    if (v15 > 0xA) {
      long long v25 = "?";
    }
    else {
      long long v25 = off_1E605C8D0[v15];
    }
    v48 = v24;
    uint64_t v50 = v25;
    LogPrintF();
  }
  if (v15 == 8)
  {
    self->_pairSetupAuthType = 8;
    self->_int pairVerifyAuthType = 8;
    if (v11 == 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 8;
    }
    -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", v26, v48, v50);
    [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFBFFFE3];
    [(RPConnection *)self _configureForSessionPairing:self->_pairSetupSession];
  }
  int v27 = self->_passwordType;
  if (v27 == 2)
  {
    self->_pairSetupAuthType = 5;
    id v28 = self->_pairSetupSession;
    uint64_t v29 = 2;
    goto LABEL_60;
  }
  if (v27 != 1)
  {
    uint64_t v30 = self->_password;
    if (![(NSString *)v30 length])
    {
      uint64_t v31 = [(RPCompanionLinkDevice *)self->_localDeviceInfo password];

      uint64_t v30 = (NSString *)v31;
    }
    if ([(NSString *)v30 length])
    {
      self->_pairSetupAuthType = 5;
      [(CUPairingSession *)self->_pairSetupSession setFixedPIN:v30];
      [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFFFFFEFLL];
      [(CUPairingSession *)self->_pairSetupSession setPinType:5];
LABEL_72:

      goto LABEL_73;
    }
    switch(v11)
    {
      case 1u:
        self->_pairSetupAuthType = 5;
        id v32 = self->_pairSetupSession;
        uint64_t v33 = 1;
        break;
      case 0xAu:
        goto LABEL_72;
      case 2u:
        self->_pairSetupAuthType = 5;
        id v32 = self->_pairSetupSession;
        uint64_t v33 = 2;
        break;
      default:
        self->_pairSetupAuthType = 6;
        [(CUPairingSession *)self->_pairSetupSession setFixedPIN:@"public"];
        goto LABEL_72;
    }
    [(CUPairingSession *)v32 setPinType:v33];
    [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFFFFFEFLL];
    goto LABEL_72;
  }
  self->_pairSetupAuthType = 5;
  id v28 = self->_pairSetupSession;
  uint64_t v29 = 1;
LABEL_60:
  -[CUPairingSession setPinType:](v28, "setPinType:", v29, v48);
  [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] & 0xFFFFFFEFLL];
LABEL_73:
  uint64_t v34 = self->_pairSetupACL;
  if (v34)
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v36 = v34;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v56;
      uint64_t v40 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v56 != v39) {
            objc_enumerationMutation(v36);
          }
          [v35 setObject:v40 forKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * i)];
        }
        uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v38);
    }

    [(CUPairingSession *)self->_pairSetupSession setAcl:v35];
  }

  if (self->_showPasswordHandler)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke;
    v54[3] = &unk_1E605C388;
    v54[4] = self;
    [(CUPairingSession *)self->_pairSetupSession setShowPINHandlerEx:v54];
  }
  else
  {
    [(CUPairingSession *)self->_pairSetupSession setFlags:[(CUPairingSession *)self->_pairSetupSession flags] | 0x80];
  }
  if (self->_hidePasswordHandler)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_2;
    v53[3] = &unk_1E605B540;
    v53[4] = self;
    [(CUPairingSession *)self->_pairSetupSession setHidePINHandler:v53];
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_3;
  v52[3] = &unk_1E605C2C0;
  v52[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:v52];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_4;
  v51[3] = &unk_1E605B5B0;
  v51[4] = self;
  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:v51];
  [(CUPairingSession *)self->_pairSetupSession activate];
LABEL_88:
  id configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
  if (configurePairingHandler) {
    configurePairingHandler[2](configurePairingHandler, self->_pairSetupSession);
  }
  CFDataGetTypeID();
  uint64_t v43 = CFDictionaryGetTypedValue();
  if (v43)
  {
    unint64_t v22 = (void *)v43;
    [(CUPairingSession *)self->_pairSetupSession receivedData:v43];
    goto LABEL_92;
  }
  uint64_t v44 = RPErrorF();
LABEL_98:
  if (v44)
  {
    int v47 = self->_ucat->var0;
    if (v47 <= 60 && (v47 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_94:
}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 408));
  int v6 = (void *)v5;
  if (v5)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 288) = 1;
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 416));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 288))
    {
      *(unsigned char *)(v3 + 288) = 0;
      id v4 = v2;
      v2[2](v2, 0);
      uint64_t v2 = (void (**)(void, void))v4;
    }
  }
}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = @"_pd";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  int v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 _sendFrameType:4 unencryptedObject:v6];
}

uint64_t __47__RPConnection__serverPairSetupWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverPairSetupCompleted:a2];
}

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v13 = v4;
  }
  else
  {
    pairSetupSession = self->_pairSetupSession;
    id v29 = 0;
    id v7 = [(CUPairingSession *)pairSetupSession openStreamWithName:@"main" error:&v29];
    id v8 = v29;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    id v10 = self->_mainStream;
    if (v10)
    {
      self->_mainAuthTagLength = [(CUPairingStream *)v10 authTagLength];
      if (self->_btPipeHighPriority)
      {
        unsigned int v11 = self->_pairSetupSession;
        id v28 = v8;
        int v12 = [(CUPairingSession *)v11 openStreamWithName:@"hipri" error:&v28];
        id v13 = v28;

        highPriorityStream = self->_highPriorityStream;
        self->_highPriorityStream = v12;

        unsigned int v15 = self->_highPriorityStream;
        if (!v15) {
          goto LABEL_25;
        }
        self->_highPriorityAuthTagLength = [(CUPairingStream *)v15 authTagLength];
      }
      else
      {
        id v13 = v8;
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t pairSetupAuthType = self->_pairSetupAuthType;
        if (pairSetupAuthType > 0xA) {
          int v18 = "?";
        }
        else {
          int v18 = off_1E605C8D0[pairSetupAuthType];
        }
        uint64_t v26 = v18;
        LogPrintF();
      }
      int v19 = self->_pairSetupAuthType;
      if (v19 == 8)
      {
        unint64_t v20 = self->_statusFlags & 0xFFFFFFDFFFFFEFFFLL | 0x2000000000;
      }
      else
      {
        if (v19 != 5)
        {
          self->_unint64_t statusFlags = self->_statusFlags & 0xFFFFFFEFFFF50FFFLL | 0x1000;
          self->_flags |= 1u;
LABEL_21:
          if (self->_internalState == 26)
          {
            self->_stepDone = 1;
            uint64_t v21 = MEMORY[0x1B3EBCC80](self->_authCompletionHandler);
            unint64_t v22 = (void *)v21;
            if (v21) {
              (*(void (**)(uint64_t, id))(v21 + 16))(v21, v13);
            }

            [(RPConnection *)self _run];
          }
LABEL_25:
          if (!v13) {
            goto LABEL_35;
          }
          goto LABEL_26;
        }
        unint64_t v20 = self->_statusFlags & 0xFFFFFFFFFFFF6FFFLL | 0x8000;
      }
      self->_unint64_t statusFlags = v20;
      goto LABEL_21;
    }
    id v13 = v8;
    if (!v8) {
      goto LABEL_35;
    }
  }
LABEL_26:
  int v23 = self->_ucat->var0;
  if (v23 <= 60 && (v23 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = self->_pairSetupAuthType;
    if (v24 > 0xA) {
      long long v25 = "?";
    }
    else {
      long long v25 = off_1E605C8D0[v24];
    }
    uint64_t v26 = v25;
    id v27 = v13;
    LogPrintF();
  }
  [(RPConnection *)self _pairSetupInvalidate];

LABEL_35:
}

- (void)_serverPairVerifyWithData:(id)a3 start:(BOOL)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  int v29 = 0;
  int v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    id v21 = RPErrorF();
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v22);
    unint64_t v20 = RPErrorF();

    goto LABEL_31;
  }
  if (a4 || !self->_pairVerifySession)
  {
    [(RPConnection *)self _pairVerifyInvalidate];
    self->_BOOL pairVerifyUsedIdentity = 0;
    id v7 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E4F5E198]);
    pairVerifySession = self->_pairVerifySession;
    self->_pairVerifySession = v7;

    if ((self->_controlFlags & 0xC0) != 0) {
      [(CUPairingSession *)self->_pairVerifySession setSelfAppFlags:1];
    }
    [(CUPairingSession *)self->_pairVerifySession setDispatchQueue:self->_dispatchQueue];
    [(CUPairingSession *)self->_pairVerifySession setFlags:self->_pairVerifyFlags];
    if (self->_label) {
      label = (__CFString *)self->_label;
    }
    else {
      label = @"RPCnx";
    }
    [(CUPairingSession *)self->_pairVerifySession setLabel:label];
    [(CUPairingSession *)self->_pairVerifySession setSessionType:4];
    unint64_t controlFlags = self->_controlFlags;
    if ((controlFlags & 0x20000000) != 0)
    {
      uint64_t v30 = @"_cf";
      unsigned int v11 = [NSNumber numberWithUnsignedLongLong:controlFlags & 0x20000000];
      v31[0] = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      [(CUPairingSession *)self->_pairVerifySession setAppInfoSelf:v12];
    }
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    int v14 = Int64Ranged;
    switch(Int64Ranged)
    {
      case 3:
        [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
        unsigned int v15 = self->_pairVerifySession;
        uint64_t v16 = [(CUPairingSession *)v15 flags] | 0x4000000;
        break;
      case 8:
        [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFE3];
        [(RPConnection *)self _configureForSessionPairing:self->_pairVerifySession];
        goto LABEL_19;
      case 4:
        [(CUPairingSession *)self->_pairVerifySession setFlags:[(CUPairingSession *)self->_pairVerifySession flags] & 0xFFBFFFFFLL];
        unsigned int v15 = self->_pairVerifySession;
        uint64_t v16 = [(CUPairingSession *)v15 flags] | 0xC;
        break;
      default:
LABEL_19:
        self->_int pairVerifyAuthType = v14;
        self->_uint64_t pairSetupAuthType = v14;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke;
        v28[3] = &unk_1E605C2C0;
        v28[4] = self;
        [(CUPairingSession *)self->_pairVerifySession setSendDataHandler:v28];
        if ((v14 - 5) <= 0xFFFFFFFD)
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2;
          v27[3] = &unk_1E605C310;
          v27[4] = self;
          [(CUPairingSession *)self->_pairVerifySession setSignDataHandler:v27];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3;
          v26[3] = &unk_1E605C338;
          v26[4] = self;
          [(CUPairingSession *)self->_pairVerifySession setVerifySignatureHandler:v26];
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4;
        v25[3] = &unk_1E605B5B0;
        v25[4] = self;
        [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:v25];
        id configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
        if (configurePairingHandler) {
          configurePairingHandler[2](configurePairingHandler, self->_pairVerifySession);
        }
        [(CUPairingSession *)self->_pairVerifySession activate];
        goto LABEL_24;
    }
    [(CUPairingSession *)v15 setFlags:v16];
    goto LABEL_19;
  }
LABEL_24:
  CFDataGetTypeID();
  uint64_t v18 = CFDictionaryGetTypedValue();
  if (v18)
  {
    int v19 = (void *)v18;
    [(CUPairingSession *)self->_pairVerifySession receivedData:v18];

LABEL_26:
    unint64_t v20 = 0;
    goto LABEL_27;
  }
  unint64_t v20 = RPErrorF();
LABEL_31:
  if (v20)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_27:
}

void __48__RPConnection__serverPairVerifyWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = @"_pd";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  int v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 _sendFrameType:6 unencryptedObject:v6];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _pairVerifySignData:a3 flags:a2 error:a4];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _pairVerifyVerifySignature:a4 data:a3 flags:a2 error:a5];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverPairVerifyCompleted:a2];
}

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && ([(CUPairingSession *)self->_pairVerifySession appInfoPeer],
          int v6 = objc_claimAutoreleasedReturnValue(),
          int Int64 = CFDictionaryGetInt64(),
          v6,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      id v69 = 0;
      uint64_t v16 = [(CUPairingSession *)pairVerifySession openStreamWithName:@"main" type:2 error:&v69];
      id v10 = v69;
      mainStream = self->_mainStream;
      self->_mainStream = v16;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      uint64_t v18 = self->_pairVerifySession;
      id v68 = v10;
      id v13 = [(CUPairingSession *)v18 openStreamWithName:@"hipri" type:2 error:&v68];
      int v14 = v68;
    }
    else
    {
      id v8 = self->_pairVerifySession;
      id v67 = 0;
      int v9 = [(CUPairingSession *)v8 openStreamWithName:@"main" error:&v67];
      id v10 = v67;
      unsigned int v11 = self->_mainStream;
      self->_mainStream = v9;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      int v12 = self->_pairVerifySession;
      id v66 = v10;
      id v13 = [(CUPairingSession *)v12 openStreamWithName:@"hipri" error:&v66];
      int v14 = v66;
    }
    id v19 = v14;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v13;

    id v21 = self->_highPriorityStream;
    id v10 = v19;
    if (!v21) {
      goto LABEL_50;
    }
    self->_highPriorityAuthTagLength = [(CUPairingStream *)v21 authTagLength];
    id v10 = v19;
LABEL_10:
    unint64_t v22 = self->_mainStream;
    if (v22)
    {
      self->_mainAuthTagLength = [(CUPairingStream *)v22 authTagLength];
      self->_pairVerifyCompleted = 1;
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] & 0xFFFFFF8FFFF50FFFLL];
      unint64_t v23 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_unint64_t statusFlags = v23;
      int pairVerifyAuthType = self->_pairVerifyAuthType;
      long long v25 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x80000];
              unint64_t v23 = self->_statusFlags | 0x80000;
              self->_unint64_t statusFlags = v23;
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v27 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x4000];
              unint64_t v38 = self->_statusFlags | 0x4000;
              self->_unint64_t statusFlags = v38;
              long long v25 = "(RPI-Family)";
              if ((v38 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 6:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x20000];
              unint64_t v39 = self->_statusFlags | 0x20000;
              self->_unint64_t statusFlags = v39;
              long long v25 = "(RPI-Friend)";
              if ((v39 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xC:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x1000000000];
              unint64_t v40 = self->_statusFlags | 0x1000000000;
              self->_unint64_t statusFlags = v40;
              long long v25 = "(RPI-SharedTVUser)";
              if ((v40 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xD:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x2000000000];
              unint64_t v41 = self->_statusFlags | 0x2000000000;
              self->_unint64_t statusFlags = v41;
              long long v25 = "(RPI-SessionPaired)";
              if ((v41 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xF:
              [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x4000000000];
              unint64_t v42 = self->_statusFlags | 0x4000000000;
              self->_unint64_t statusFlags = v42;
              long long v25 = "(RPI-AdHocPaired)";
              if ((v42 & 0x80000) != 0) {
                goto LABEL_36;
              }
              goto LABEL_39;
            default:
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v27 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity) {
                long long v25 = v27;
              }
              else {
                long long v25 = "(HK)";
              }
              if ((v23 & 0x80000) == 0) {
                goto LABEL_39;
              }
LABEL_36:
              uint64_t v43 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
              uint64_t v44 = [v43 identifier];
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v44;

              break;
          }
          goto LABEL_39;
        case 3:
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x2000];
          self->_statusFlags |= 0x2000uLL;
          id v28 = [(CUPairingSession *)self->_pairVerifySession pairedPeer];
          int v29 = [v28 identifier];
          uint64_t v30 = [v29 UUIDString];
          uint64_t v31 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v30;

          long long v25 = "HKShared";
          goto LABEL_39;
        case 4:
          id v32 = [(CUPairingSession *)self->_pairVerifySession aclActual];
          uint64_t v33 = CFDictionaryGetInt64();

          if (v33)
          {
            uint64_t v34 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
            id v35 = [v34 identifier];
            id v36 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v35;

            uint64_t v37 = 557056;
          }
          else
          {
            uint64_t v37 = 0x8000;
          }
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | v37];
          self->_statusFlags |= v37;
          long long v25 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            int v46 = [(CUPairingSession *)self->_pairVerifySession pairedPeer];
            if (v46)
            {
              int v47 = objc_alloc_init(RPIdentity);
              v48 = [v46 publicKey];
              [(RPIdentity *)v47 setEdPKData:v48];

              id v49 = [v46 identifier];
              uint64_t v50 = [v49 UUIDString];
              [(RPIdentity *)v47 setIdentifier:v50];

              [(RPIdentity *)v47 setType:8];
              identityVerified = self->_identityVerified;
              self->_identityVerified = v47;
              id v52 = v47;

              uint64_t v53 = [(RPIdentity *)self->_identityVerified identifier];
              [(RPEndpoint *)self->_peerDeviceInfo setVerifiedIdentity:v53];
            }
          }
          break;
        case 5:
          break;
        case 6:
          long long v25 = "PSGuest";
          break;
        case 7:
          long long v25 = "PV-AID";
          break;
        case 10:
          long long v25 = "AuthEnd";
          break;
        default:
          long long v25 = "?";
          break;
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v64 = &unk_1B3970EF6;
        int v65 = self->_identityVerified;
        unsigned int v62 = &unk_1B39710C3;
        unint64_t statusFlags = self->_statusFlags;
        long long v60 = v25;
        id flags = self->_flags;
        LogPrintF();
      }
      if (self->_internalState == 26)
      {
        self->_stepDone = 1;
        [(RPConnection *)self _run];
      }
    }
LABEL_50:
    if (!v10) {
      goto LABEL_62;
    }
    goto LABEL_51;
  }
  id v10 = v4;
LABEL_51:
  int v55 = self->_ucat->var0;
  if (v55 <= 60 && (v55 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v56 = self->_pairVerifyAuthType;
    if (v56 > 0xA) {
      long long v57 = "?";
    }
    else {
      long long v57 = off_1E605C8D0[v56];
    }
    long long v60 = v57;
    id flags = v10;
    LogPrintF();
  }
  [(RPConnection *)self _pairVerifyInvalidate];
  uint64_t v58 = MEMORY[0x1B3EBCC80](self->_pairVerifyCompletion);
  int v59 = (void *)v58;
  if (v58) {
    (*(void (**)(uint64_t, id))(v58 + 16))(v58, v10);
  }

LABEL_62:
}

- (void)_serverStarted
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v4 = startTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_startTimer;
    self->_startTimer = 0;
  }
  if (!self->_peerIdentifier)
  {
    RandomBytes();
    NSPrintF();
    int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    peerIdentifier = self->_peerIdentifier;
    self->_peerIdentifier = v6;
  }
}

- (void)_processSends
{
  uint64_t v3 = [(NSMutableArray *)self->_sendArray firstObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      [(NSMutableArray *)self->_sendArray removeObjectAtIndex:0];
      id v5 = [v4 requestID];

      if (v5)
      {
        int v6 = [v4 requestID];
        id v7 = [v4 request];
        uint64_t v8 = [v4 xpcID];
        int v9 = [v4 options];
        id v10 = [v4 responseHandler];
        [(RPConnection *)self _sendEncryptedRequestID:v6 request:v7 xpcID:v8 options:v9 sendEntry:v4 responseHandler:v10];
      }
      else
      {
        unsigned int v11 = [v4 eventID];

        if (!v11)
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_8;
        }
        int v6 = [v4 eventID];
        id v7 = [v4 eventData];
        uint64_t v12 = [v4 xid];
        int v9 = [v4 options];
        id v10 = [v4 completion];
        [(RPConnection *)self _sendEncryptedEventID:v6 data:v7 xid:v12 options:v9 completion:v10];
      }

LABEL_8:
      id v4 = [(NSMutableArray *)self->_sendArray firstObject];
    }
    while (v4);
  }
}

- (void)sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v25 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v14)
    {
      id v19 = RPErrorF();
      v14[2](v14, v19);
    }
  }
  else
  {
    int internalState = self->_internalState;
    BOOL v17 = internalState == 28 || internalState == 21;
    if (v17 && ![(NSMutableArray *)self->_sendArray count])
    {
      [(RPConnection *)self _sendEncryptedEventID:v25 data:v12 xid:v9 options:v13 completion:v14];
    }
    else
    {
      int v18 = self->_ucat->var0;
      if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = v9;
        uint64_t v24 = [(NSMutableArray *)self->_sendArray count];
        id v22 = v25;
        LogPrintF();
      }
      unint64_t v20 = objc_alloc_init(RPSendEntry);
      [(RPSendEntry *)v20 setCompletion:v14];
      [(RPSendEntry *)v20 setEventID:v25];
      [(RPSendEntry *)v20 setEventData:v12];
      [(RPSendEntry *)v20 setOptions:v13];
      [(RPSendEntry *)v20 setQueueTicks:mach_absolute_time()];
      if (!v9)
      {
        unsigned int xidLast = self->_xidLast;
        if (xidLast + 1 > 1) {
          uint64_t v9 = xidLast + 1;
        }
        else {
          uint64_t v9 = 1;
        }
        self->_unsigned int xidLast = v9;
      }
      -[RPSendEntry setXid:](v20, "setXid:", v9, v22, v23, v24);
      [(NSMutableArray *)self->_sendArray addObject:v20];
    }
  }
}

- (void)sendEncryptedEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v14 = xidLast + 1;
  }
  else {
    uint64_t v14 = 1;
  }
  self->_unsigned int xidLast = v14;
  id v15 = a4;
  uint64_t Int64 = CFDictionaryGetInt64();
  BOOL v17 = (void *)MEMORY[0x1E4F1CA60];
  int v18 = [NSNumber numberWithUnsignedInt:v14];
  id v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v15, @"_c", v10, @"_i", &unk_1F0C374F8, @"_t", v18, @"_x", 0);

  if (Int64) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_cht"];
  }
  unint64_t v20 = [v11 objectForKeyedSubscript:@"inUseProcess"];
  if (v20)
  {
    BOOL clientMode = self->_clientMode;

    if (clientMode)
    {
      id v22 = [v11 objectForKeyedSubscript:@"inUseProcess"];
      [v19 setObject:v22 forKeyedSubscript:@"_inUseProc"];
    }
  }
  int v25 = 0;
  uint64_t v23 = (void *)MEMORY[0x1B3EBC190](v19, 16 * self->_canDecode128bit, &v25);
  if (v23)
  {
    [(RPConnection *)self sendEncryptedEventID:v10 data:v23 xid:v14 options:v11 completion:v12];
  }
  else if (v12)
  {
    uint64_t v24 = RPErrorF();
    v12[2](v12, v24);
  }
}

- (void)_sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v52 = *(void *)&a5;
  v76[2] = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v56 = a4;
  id v57 = a6;
  id v11 = a7;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3032000000;
  id v73 = __Block_byref_object_copy__1;
  int v74 = __Block_byref_object_dispose__1;
  id v75 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke;
  v67[3] = &unk_1E605C3B0;
  id v69 = &v70;
  id v53 = v11;
  id v68 = v53;
  id v12 = (void (**)(void, void))MEMORY[0x1B3EBCC80](v67);
  btPipe = self->_btPipe;
  if (!btPipe
    || [(CUBluetoothScalablePipe *)btPipe peerHostState] == 2
    || !CFDictionaryGetInt64())
  {
    int v55 = self->_requestable;
    if ([(CUBluetoothScalablePipe *)self->_btPipeHighPriority state] == 1
      && CFDictionaryGetInt64())
    {
      uint64_t v16 = self->_btPipeHighPriority;

      int v17 = 1;
      int v55 = v16;
    }
    else
    {
      int v17 = 0;
    }
    int v66 = 8;
    uint64_t v18 = [v56 length];
    unint64_t mainAuthTagLength = self->_mainAuthTagLength;
    unint64_t v20 = self->_mainStream;
    if (v17)
    {
      id v21 = self->_highPriorityStream;

      LOBYTE(v66) = 12;
      unint64_t v22 = self->_highPriorityAuthTagLength + [v56 length];
      unint64_t v20 = v21;
    }
    else
    {
      unint64_t v22 = mainAuthTagLength + v18;
    }
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v22 >> 24)
    {
      RPErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      int v25 = 0;
    }
    else
    {
      uint64_t v24 = Int64;
      BYTE1(v66) = BYTE2(v22);
      BYTE2(v66) = BYTE1(v22);
      HIBYTE(v66) = v22;
      int v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v66 length:4];
      if (v20)
      {
        id v65 = 0;
        uint64_t v26 = [(CUPairingStream *)v20 encryptData:v56 aadData:v25 error:&v65];
        id v14 = v65;
        if (v26)
        {
          if (!v24)
          {
            id v27 = v54;
            if (([v27 isEqual:@"HIDRelay"] & 1) != 0
              || ([v27 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
              || ([v27 isEqual:@"_hidT"] & 1) != 0
              || ([v27 isEqual:@"_laData"] & 1) != 0)
            {
            }
            else
            {
              int v45 = [v27 isEqual:@"_siA"];

              if (!v45)
              {
                int v28 = 30;
                goto LABEL_24;
              }
            }
          }
          int v28 = 10;
LABEL_24:
          int var0 = self->_ucat->var0;
          if (v28 >= var0 && (var0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t linkType = self->_linkType;
            if (linkType > 0xB) {
              uint64_t v31 = "?";
            }
            else {
              uint64_t v31 = off_1E605C928[linkType];
            }
            id v32 = "";
            if (v17) {
              id v32 = "at high priority";
            }
            uint64_t v50 = v31;
            v51 = v32;
            v48 = v26;
            unint64_t v49 = v22;
            id v46 = v54;
            uint64_t v47 = v52;
            LogPrintF();
          }
          uint64_t v33 = +[RPConnectionMetrics sharedMetrics];
          [v33 logMessageForClient:self->_initiator length:v22 linkType:self->_linkType];

          uint64_t v34 = [v57 objectForKeyedSubscript:@"nwActivityMetrics"];
          id v35 = v34;
          if (v34)
          {
            [v34 setEventSize:v22];
            [v35 submitMetrics];
          }
          uint64_t v36 = +[RPNWActivityMessageMetrics startMessageMetrics:1 withParent:v35];
          uint64_t v37 = (void *)v71[5];
          v71[5] = v36;

          [(id)v71[5] setMessageSize:v22];
          [(id)v71[5] setLinkType:self->_linkType];
          unint64_t v38 = [(RPEndpoint *)self->_peerDeviceInfo model];
          [(id)v71[5] setPeerDeviceModel:v38];

          peerDeviceInfo = self->_peerDeviceInfo;
          if (peerDeviceInfo)
          {
            [(RPEndpoint *)peerDeviceInfo operatingSystemVersion];
          }
          else
          {
            long long v63 = 0uLL;
            uint64_t v64 = 0;
          }
          unint64_t v40 = (void *)v71[5];
          long long v61 = v63;
          uint64_t v62 = v64;
          [v40 setPeerOSVersion:&v61];
          [(id)v71[5] submitMetrics];
          id v41 = objc_alloc_init(MEMORY[0x1E4F5E230]);
          unint64_t v42 = v41;
          if (v12)
          {
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke_2;
            v58[3] = &unk_1E605B650;
            id v59 = v41;
            long long v60 = v12;
            [v59 setCompletion:v58];
          }
          v76[0] = v25;
          v76[1] = v26;
          uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
          [v42 setDataArray:v43];

          [(CUReadWriteRequestable *)v55 writeWithRequest:v42];
          if (!v14) {
            goto LABEL_47;
          }
          goto LABEL_42;
        }
LABEL_56:
        unint64_t v42 = 0;
        id v35 = 0;
        if (!v14)
        {
LABEL_47:

          goto LABEL_48;
        }
LABEL_42:
        int v44 = self->_ucat->var0;
        if (v44 <= 90 && (v44 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        ((void (**)(void, id))v12)[2](v12, v14);
        goto LABEL_47;
      }
      RPErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v26 = 0;
    goto LABEL_56;
  }
  RPErrorF();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  ((void (**)(void, id))v12)[2](v12, v14);
  int v25 = 0;
  uint64_t v26 = 0;
  unint64_t v42 = 0;
  id v35 = 0;
LABEL_48:

  _Block_object_dispose(&v70, 8);
}

void __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) nwActivity];
  if (v3)
  {
    if (v5) {
      +[RPNWActivityUtils failActivity:error:](RPNWActivityUtils, "failActivity:error:", v3);
    }
    else {
      nw_activity_complete_with_reason();
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = (id)v2;
  if (v2)
  {
    uint64_t v4 = RPNestedErrorF();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 responseHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unint64_t v20 = RPErrorF();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v20);
  }
  else
  {
    int internalState = self->_internalState;
    BOOL v18 = internalState == 28 || internalState == 21;
    if (v18 && ![(NSMutableArray *)self->_sendArray count])
    {
      [(RPConnection *)self _sendEncryptedRequestID:v12 request:v13 xpcID:v9 options:v14 sendEntry:0 responseHandler:v15];
    }
    else
    {
      int v19 = self->_ucat->var0;
      if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
      {
        id v24 = v12;
        uint64_t v25 = [(NSMutableArray *)self->_sendArray count];
        LogPrintF();
      }
      id v21 = objc_alloc_init(RPSendEntry);
      [(RPSendEntry *)v21 setOptions:v14];
      [(RPSendEntry *)v21 setQueueTicks:mach_absolute_time()];
      [(RPSendEntry *)v21 setRequestID:v12];
      [(RPSendEntry *)v21 setRequest:v13];
      [(RPSendEntry *)v21 setXpcID:v9];
      [(RPSendEntry *)v21 setResponseHandler:v15];
      if (v14)
      {
        CFDictionaryGetDouble();
        if (v22 > 0.0)
        {
          uint64_t v23 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke;
          handler[3] = &unk_1E605C3D8;
          handler[4] = v23;
          void handler[5] = self;
          handler[6] = v21;
          dispatch_source_set_event_handler(v23, handler);
          CUDispatchTimerSet();
          dispatch_resume(v23);
          [(RPSendEntry *)v21 setTimer:v23];
        }
      }
      -[NSMutableArray addObject:](self->_sendArray, "addObject:", v21, v24, v25);
    }
  }
}

uint64_t __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _timeoutForSendEntry:v3];
}

- (void)_sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 sendEntry:(id)a7 responseHandler:(id)a8
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  id v73 = a4;
  id v13 = a6;
  id v81 = a7;
  id v76 = a8;
  uint64_t v96 = 0;
  id v97 = &v96;
  uint64_t v98 = 0x3032000000;
  id v99 = __Block_byref_object_copy__1;
  unsigned int v100 = __Block_byref_object_dispose__1;
  id v101 = 0;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke;
  v93[3] = &unk_1E605C400;
  id v94 = 0;
  uint64_t v95 = &v96;
  uint64_t v72 = (void *)MEMORY[0x1B3EBCC80](v93);
  btPipe = self->_btPipe;
  if (btPipe
    && [(CUBluetoothScalablePipe *)btPipe peerHostState] != 2
    && CFDictionaryGetInt64())
  {
    RPErrorF();
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v76 + 2))(v76, 0, 0, v79);
    uint64_t v31 = 0;
    uint64_t v52 = 0;
    id v58 = 0;
    uint64_t v77 = 0;
    v78 = 0;
    id v27 = 0;
    goto LABEL_73;
  }
  int v74 = self->_requestable;
  id v75 = self->_mainStream;
  if ([(CUBluetoothScalablePipe *)self->_btPipeHighPriority state] == 1 && CFDictionaryGetInt64())
  {
    uint64_t v16 = self->_btPipeHighPriority;

    uint64_t v17 = 1;
    int v74 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    os_signpost_id_t v19 = xidLast + 1;
  }
  else {
    os_signpost_id_t v19 = 1;
  }
  self->_unsigned int xidLast = v19;
  id v82 = [NSNumber numberWithUnsignedInt:v19];
  unint64_t v20 = (void *)MEMORY[0x1E4F1CA60];
  id v21 = [NSNumber numberWithBool:v17];
  uint64_t v80 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v73, @"_c", v83, @"_i", &unk_1F0C37510, @"_t", v82, @"_x", v21, @"_btHP", 0);

  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64) {
    [v80 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_cht"];
  }
  uint64_t v23 = [v13 objectForKeyedSubscript:@"inUseProcess"];
  if (v23)
  {
    BOOL v24 = !self->_clientMode;

    if (!v24)
    {
      uint64_t v25 = [v13 objectForKeyedSubscript:@"inUseProcess"];
      [v80 setObject:v25 forKeyedSubscript:@"_inUseProc"];
    }
  }
  if (CFDictionaryGetInt64()) {
    [v80 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_pttEligible"];
  }
  int v92 = 0;
  uint64_t v26 = (void *)MEMORY[0x1B3EBC190](v80, 16 * self->_canDecode128bit, &v92);
  id v27 = v26;
  if (!v26
    || ((int v91 = 8, v28 = [v26 length], !v17)
      ? (CUPairingStream *)(unint64_t v30 = self->_mainAuthTagLength + v28)
      : (int v29 = self->_highPriorityStream,
         v75,
         LOBYTE(v91) = 12,
         unint64_t v30 = self->_highPriorityAuthTagLength + [v27 length],
         id v75 = v29),
        v30 >> 24))
  {
    RPErrorF();
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = 0;
    uint64_t v52 = 0;
    id v58 = 0;
    uint64_t v77 = 0;
    v78 = 0;
  }
  else
  {
    BYTE1(v91) = BYTE2(v30);
    BYTE2(v91) = BYTE1(v30);
    HIBYTE(v91) = v30;
    v78 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v91 length:4];
    if (v75)
    {
      id v90 = 0;
      uint64_t v77 = [(CUPairingStream *)v75 encryptData:v27 aadData:v78 error:&v90];
      id v79 = v90;
      if (v77)
      {
        uint64_t v31 = objc_alloc_init(RPRequestEntry);
        [(RPRequestEntry *)v31 setOptions:v13];
        [(RPRequestEntry *)v31 setRequestID:v83];
        [(RPRequestEntry *)v31 setResponseHandler:v76];
        [(RPRequestEntry *)v31 setSendTicks:mach_absolute_time()];
        [(RPRequestEntry *)v31 setXpcID:a5];
        [(RPRequestEntry *)v31 setLength:v30];
        if (v81)
        {
          id v32 = [v81 timer];
          [(RPRequestEntry *)v31 setTimer:v32];

          [v81 setXidObj:v82];
        }
        requests = self->_requests;
        if (!requests)
        {
          uint64_t v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v35 = self->_requests;
          self->_requests = v34;

          requests = self->_requests;
        }
        [(NSMutableDictionary *)requests setObject:v31 forKeyedSubscript:v82];
        uint64_t v36 = RPConnectionLog();
        if (os_signpost_enabled(v36))
        {
          uint64_t v37 = [v83 UTF8String];
          label = self->_label;
          uint64_t linkType = self->_linkType;
          if (linkType > 0xB) {
            unint64_t v40 = "?";
          }
          else {
            unint64_t v40 = off_1E605C928[linkType];
          }
          peerIdentifier = self->_peerIdentifier;
          *(_DWORD *)buf = 67110658;
          int v105 = v19;
          __int16 v106 = 2080;
          uint64_t v107 = v37;
          __int16 v108 = 2112;
          id v109 = label;
          __int16 v110 = 2048;
          unint64_t v111 = v30;
          __int16 v112 = 2080;
          v113 = v40;
          __int16 v114 = 1024;
          int v115 = v17;
          __int16 v116 = 2112;
          v117 = peerIdentifier;
          _os_signpost_emit_with_name_impl(&dword_1B38EA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v19, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, requestSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpost.description:begin_time}", buf, 0x40u);
        }
        BOOL v42 = Int64 == 0;

        id v43 = v83;
        int v44 = v43;
        if (v42)
        {
          if (([v43 isEqual:@"_ftSm"] & 1) != 0
            || ([v44 isEqual:@"_ftLg"] & 1) != 0)
          {
            int v45 = 9;
          }
          else if ([v44 isEqual:@"_ftRs"])
          {
            int v45 = 9;
          }
          else
          {
            int v45 = 30;
          }
        }
        else
        {
          int v45 = 10;
        }

        int v46 = self->_ucat->var0;
        if (v45 >= v46 && (v46 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v47 = self->_linkType;
          if (v47 > 0xB) {
            v48 = "?";
          }
          else {
            v48 = off_1E605C928[v47];
          }
          unint64_t v49 = "";
          if (v17) {
            unint64_t v49 = "at high priority";
          }
          id v69 = v48;
          uint64_t v70 = v49;
          id v67 = v77;
          unint64_t v68 = v30;
          id v65 = v44;
          os_signpost_id_t v66 = v19;
          LogPrintF();
        }
        uint64_t v50 = +[RPConnectionMetrics sharedMetrics];
        [v50 logMessageForClient:self->_initiator length:v30 linkType:self->_linkType];

        v51 = [v13 objectForKeyedSubscript:@"nwActivityMetrics"];
        uint64_t v52 = v51;
        if (v51) {
          [v51 setRequestSize:v30];
        }
        uint64_t v53 = +[RPNWActivityMessageMetrics startMessageMetrics:2 withParent:v52];
        id v54 = (void *)v97[5];
        v97[5] = v53;

        [(id)v97[5] setMessageSize:v30];
        [(id)v97[5] setLinkType:self->_linkType];
        int v55 = [(RPEndpoint *)self->_peerDeviceInfo model];
        [(id)v97[5] setPeerDeviceModel:v55];

        peerDeviceInfo = self->_peerDeviceInfo;
        if (peerDeviceInfo)
        {
          [(RPEndpoint *)peerDeviceInfo operatingSystemVersion];
        }
        else
        {
          long long v88 = 0uLL;
          uint64_t v89 = 0;
        }
        id v57 = (void *)v97[5];
        long long v86 = v88;
        uint64_t v87 = v89;
        [v57 setPeerOSVersion:&v86];
        [(id)v97[5] submitMetrics];
        id v58 = objc_alloc_init(MEMORY[0x1E4F5E230]);
        [v58 setCompletion:v72];
        if (v30)
        {
          v103[0] = v78;
          v103[1] = v77;
          id v59 = (void **)v103;
          uint64_t v60 = 2;
        }
        else
        {
          uint64_t v102 = v78;
          id v59 = &v102;
          uint64_t v60 = 1;
        }
        long long v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:v60];
        [v58 setDataArray:v61];

        [(CUReadWriteRequestable *)v74 writeWithRequest:v58];
        if (v13)
        {
          CFDictionaryGetDouble();
          if (v62 > 0.0)
          {
            long long v63 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke_406;
            handler[3] = &unk_1E605C428;
            handler[4] = v63;
            void handler[5] = self;
            handler[6] = v82;
            int v85 = v19;
            dispatch_source_set_event_handler(v63, handler);
            CUDispatchTimerSet();
            dispatch_resume(v63);
            [(RPRequestEntry *)v31 setTimer:v63];
          }
        }
        goto LABEL_66;
      }
      uint64_t v31 = 0;
      uint64_t v52 = 0;
      id v58 = 0;
    }
    else
    {
      RPErrorF();
      id v79 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = 0;
      uint64_t v52 = 0;
      id v58 = 0;
      id v75 = 0;
    }
    uint64_t v77 = 0;
  }
LABEL_66:
  if (v79)
  {
    int v64 = self->_ucat->var0;
    if (v64 <= 90 && (v64 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v76 + 2))(v76, 0, 0, v79);
  }

LABEL_73:
  _Block_object_dispose(&v96, 8);
}

void __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) nwActivity];
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = [*(id *)(a1 + 32) error];
    if (v3) {
      +[RPNWActivityUtils failActivity:v4 error:v3];
    }
    else {
      nw_activity_complete_with_reason();
    }

    uint64_t v2 = v4;
  }
}

void __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke_406(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  [*(id *)(a1 + 40) _timeoutForXID:*(void *)(a1 + 48)];
  uint64_t v2 = RPConnectionLog();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(unsigned int *)(a1 + 56);
  if (v4 && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v5 + 640);
    uint64_t v7 = *(void *)(v5 + 680);
    v8[0] = 67109634;
    v8[1] = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_1B38EA000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, peer:%@, signpost.description:end_time, error:request_timed_out}", (uint8_t *)v8, 0x1Cu);
  }
}

- (void)_sendEncryptedResponse:(id)a3 options:(id)a4 error:(id)a5 xid:(id)a6 requestID:(id)a7 highPriority:(BOOL)a8 isChatty:(BOOL)a9 replyStartTime:(id)a10
{
  BOOL v72 = a8;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v65 = a4;
  id v75 = a5;
  id v74 = a6;
  id v68 = a7;
  id v73 = a10;
  uint64_t v86 = 0;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x3032000000;
  uint64_t v89 = __Block_byref_object_copy__1;
  id v90 = __Block_byref_object_dispose__1;
  id v91 = 0;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __104__RPConnection__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime___block_invoke;
  v83[3] = &unk_1E605C400;
  id v84 = 0;
  int v85 = &v86;
  id v67 = (void *)MEMORY[0x1B3EBCC80](v83);
  id v15 = self->_requestable;
  uint64_t v16 = self->_mainStream;
  btPipeHighPriority = self->_btPipeHighPriority;
  if (btPipeHighPriority && v72)
  {
    BOOL v18 = btPipeHighPriority;

    id v15 = v18;
  }
  mach_absolute_time();
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v20 = v19;
  if (v75) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v69 == 0;
  }
  if (v21) {
    id v22 = (id)MEMORY[0x1E4F1CC08];
  }
  else {
    id v22 = v69;
  }
  [v19 setObject:v22 forKeyedSubscript:@"_c"];
  [v20 setObject:&unk_1F0C37528 forKeyedSubscript:@"_t"];
  [v20 setObject:v74 forKeyedSubscript:@"_x"];
  os_signpost_id_t spid = [v74 unsignedIntValue];
  if (v75)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      os_signpost_id_t v59 = spid;
      id v60 = v75;
      LogPrintF();
    }
    RPEncodeNSError(v75, v20);
  }
  os_signpost_id_t v66 = v15;
  if (v73)
  {
    [v73 unsignedLongLongValue];
    BOOL v24 = [NSNumber numberWithUnsignedLongLong:UpTicksToMilliseconds()];
    [v20 setObject:v24 forKeyedSubscript:@"_rT"];
  }
  int v82 = 0;
  uint64_t v25 = (void *)MEMORY[0x1B3EBC190](v20, 16 * self->_canDecode128bit, &v82);
  uint64_t v26 = v25;
  if (!v25) {
    goto LABEL_62;
  }
  int v81 = 8;
  uint64_t v27 = [v25 length];
  if (v72)
  {
    LOBYTE(v81) = 12;
    uint64_t v28 = [v26 length];
    unint64_t highPriorityAuthTagLength = self->_highPriorityAuthTagLength;
    unint64_t v30 = self->_highPriorityStream;

    unint64_t v31 = highPriorityAuthTagLength + v28;
    uint64_t v16 = v30;
  }
  else
  {
    unint64_t v31 = self->_mainAuthTagLength + v27;
  }
  if (v31 >> 24)
  {
LABEL_62:
    RPErrorF();
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = 0;
    id v32 = 0;
LABEL_64:
    uint64_t v33 = 0;
    goto LABEL_56;
  }
  BYTE1(v81) = BYTE2(v31);
  BYTE2(v81) = BYTE1(v31);
  HIBYTE(v81) = v31;
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v81 length:4];
  if (!v16)
  {
    RPErrorF();
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = 0;
    uint64_t v16 = 0;
    goto LABEL_64;
  }
  id v80 = 0;
  uint64_t v33 = [(CUPairingStream *)v16 encryptData:v26 aadData:v32 error:&v80];
  id v70 = v80;
  if (v33)
  {
    id v34 = v68;
    id v35 = v34;
    if (a9)
    {
      int v36 = 10;
    }
    else if (([v34 isEqual:@"_ftSm"] & 1) != 0 {
           || ([v35 isEqual:@"_ftLg"] & 1) != 0)
    }
    {
      int v36 = 9;
    }
    else if ([v35 isEqual:@"_ftRs"])
    {
      int v36 = 9;
    }
    else
    {
      int v36 = 30;
    }

    int v37 = self->_ucat->var0;
    if (v36 >= v37 && (v37 != -1 || _LogCategory_Initialize()))
    {
      uint64_t linkType = self->_linkType;
      if (linkType > 0xB) {
        unint64_t v39 = "?";
      }
      else {
        unint64_t v39 = off_1E605C928[linkType];
      }
      uint64_t v40 = objc_msgSend(v75, "code", v59, v60);
      id v41 = "";
      if (v72) {
        id v41 = " at high priority";
      }
      long long v63 = v41;
      uint64_t v64 = v40;
      unint64_t v61 = v31;
      double v62 = v39;
      os_signpost_id_t v59 = spid;
      id v60 = v33;
      LogPrintF();
    }
    BOOL v42 = +[RPConnectionMetrics sharedMetrics];
    [v42 logMessageForClient:self->_initiator length:v31 linkType:self->_linkType];

    id v43 = RPConnectionLog();
    int v44 = v43;
    if (spid && os_signpost_enabled(v43))
    {
      label = self->_label;
      uint64_t v46 = self->_linkType;
      if (v46 > 0xB) {
        uint64_t v47 = "?";
      }
      else {
        uint64_t v47 = off_1E605C928[v46];
      }
      peerIdentifier = self->_peerIdentifier;
      *(_DWORD *)buf = 67110402;
      int v95 = spid;
      __int16 v96 = 2112;
      id v97 = label;
      __int16 v98 = 2048;
      unint64_t v99 = v31;
      __int16 v100 = 2080;
      id v101 = v47;
      __int16 v102 = 1024;
      BOOL v103 = v72;
      __int16 v104 = 2112;
      int v105 = peerIdentifier;
      _os_signpost_emit_with_name_impl(&dword_1B38EA000, v44, OS_SIGNPOST_INTERVAL_END, spid, "RPConnectionClientResponseTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, responseSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpost.description:end_time}", buf, 0x36u);
    }

    uint64_t v49 = +[RPNWActivityMessageMetrics startMessageMetrics:3 withParent:0];
    uint64_t v50 = (void *)v87[5];
    v87[5] = v49;

    [(id)v87[5] setMessageSize:v31];
    [(id)v87[5] setLinkType:self->_linkType];
    v51 = [(RPEndpoint *)self->_peerDeviceInfo model];
    [(id)v87[5] setPeerDeviceModel:v51];

    peerDeviceInfo = self->_peerDeviceInfo;
    if (peerDeviceInfo)
    {
      [(RPEndpoint *)peerDeviceInfo operatingSystemVersion];
    }
    else
    {
      long long v78 = 0uLL;
      uint64_t v79 = 0;
    }
    uint64_t v53 = (void *)v87[5];
    long long v76 = v78;
    uint64_t v77 = v79;
    [v53 setPeerOSVersion:&v76];
    [(id)v87[5] submitMetrics];
    id v54 = objc_alloc_init(MEMORY[0x1E4F5E230]);
    [v54 setCompletion:v67];
    if (v31)
    {
      v93[0] = v32;
      v93[1] = v33;
      int v55 = (void **)v93;
      uint64_t v56 = 2;
    }
    else
    {
      int v92 = v32;
      int v55 = &v92;
      uint64_t v56 = 1;
    }
    id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:v56];
    [v54 setDataArray:v57];

    [(CUReadWriteRequestable *)v66 writeWithRequest:v54];
  }
  else
  {
    id v54 = 0;
  }
LABEL_56:
  if (v70)
  {
    int v58 = self->_ucat->var0;
    if (v58 <= 90 && (v58 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }

  _Block_object_dispose(&v86, 8);
}

void __104__RPConnection__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) nwActivity];
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = [*(id *)(a1 + 32) error];
    if (v3) {
      +[RPNWActivityUtils failActivity:v4 error:v3];
    }
    else {
      nw_activity_complete_with_reason();
    }

    uint64_t v2 = v4;
  }
}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v23 = v4;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (!(v7 >> 24))
  {
    BYTE1(v23) = BYTE2(v7);
    BYTE2(v23) = BYTE1(v7);
    HIBYTE(v23) = v7;
    __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v23 length:4];
    int var0 = self->_ucat->var0;
    if (var0 > 9 || var0 == -1 && !_LogCategory_Initialize())
    {
LABEL_37:
      id v12 = objc_alloc_init(MEMORY[0x1E4F5E230]);
      if (v8)
      {
        v25[0] = v9;
        v25[1] = v6;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
        id v14 = (void **)v25;
        uint64_t v15 = 2;
      }
      else
      {
        BOOL v24 = v9;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
        id v14 = &v24;
        uint64_t v15 = 1;
      }
      uint64_t v16 = objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21, v22);
      [v12 setDataArray:v16];

      [(CUReadWriteRequestable *)self->_requestable writeWithRequest:v12];
      uint64_t v17 = 0;
      goto LABEL_41;
    }
    if ((int)v4 <= 47)
    {
      __int16 v11 = "Invalid";
      switch((int)v4)
      {
        case 0:
          goto LABEL_36;
        case 1:
          __int16 v11 = "NoOp";
          break;
        case 3:
          __int16 v11 = "PS_Start";
          break;
        case 4:
          __int16 v11 = "PS_Next";
          break;
        case 5:
          __int16 v11 = "PV_Start";
          break;
        case 6:
          __int16 v11 = "PV_Next";
          break;
        case 7:
          __int16 v11 = "U_OPACK";
          break;
        case 8:
          __int16 v11 = "E_OPACK";
          break;
        case 9:
          __int16 v11 = "P_OPACK";
          break;
        case 10:
          __int16 v11 = "PA_Req";
          break;
        case 11:
          __int16 v11 = "PA_Rsp";
          break;
        case 16:
          __int16 v11 = "SessionStartRequest";
          break;
        case 17:
          __int16 v11 = "SessionStartResponse";
          break;
        case 18:
          __int16 v11 = "SessionData";
          break;
        case 32:
          __int16 v11 = "FamilyIdentityRequest";
          break;
        case 33:
          __int16 v11 = "FamilyIdentityResponse";
          break;
        case 34:
          __int16 v11 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_35;
      }
      goto LABEL_36;
    }
    if ((int)v4 <= 63)
    {
      if (v4 == 48)
      {
        __int16 v11 = "WatchIdentityRequest";
        goto LABEL_36;
      }
      if (v4 == 49)
      {
        __int16 v11 = "WatchIdentityResponse";
        goto LABEL_36;
      }
    }
    else
    {
      switch(v4)
      {
        case '@':
          __int16 v11 = "FriendIdentityRequest";
          goto LABEL_36;
        case 'A':
          __int16 v11 = "FriendIdentityResponse";
          goto LABEL_36;
        case 'B':
          __int16 v11 = "FriendIdentityUpdate";
LABEL_36:
          id v21 = v6;
          unint64_t v22 = v8;
          uint64_t v19 = v4;
          unint64_t v20 = v11;
          LogPrintF();
          goto LABEL_37;
      }
    }
LABEL_35:
    __int16 v11 = "?";
    goto LABEL_36;
  }
  uint64_t v17 = RPErrorF();
  if (v17)
  {
    int v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_41:
}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4 = a3;
  int v8 = 0;
  id v6 = (void *)MEMORY[0x1B3EBC190](a4, 16 * self->_canDecode128bit, &v8);
  if (v6)
  {
    [(RPConnection *)self _sendFrameType:v4 body:v6];
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      RPFrameTypeToString(v4);
      LogPrintF();
    }
  }
}

- (void)sendReachabilityProbe:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPConnection *)self _sendFrameType:1 body:0];
}

- (void)processSendsUsingConnection:(id)a3
{
  id v36 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = [(NSMutableArray *)self->_sendArray firstObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      [(NSMutableArray *)self->_sendArray removeObjectAtIndex:0];
      id v6 = [v5 options];
      double v7 = 0.0;
      double v8 = 0.0;
      if (v6)
      {
        __int16 v9 = [v5 options];
        CFDictionaryGetDouble();
        double v8 = v10;
      }
      __int16 v11 = [v5 timer];

      if (v11 && v8 > 0.0)
      {
        mach_absolute_time();
        [v5 queueTicks];
        UpTicksToSecondsF();
        double v13 = v8 - v12;
        if (v13 > 1.0) {
          double v7 = v13;
        }
        else {
          double v7 = 1.0;
        }
        id v14 = [v5 options];
        uint64_t v15 = (void *)[v14 mutableCopy];

        uint64_t v16 = [NSNumber numberWithDouble:v7];
        [v15 setObject:v16 forKeyedSubscript:@"timeoutSeconds"];

        [v5 setOptions:v15];
        uint64_t v17 = [v5 timer];
        dispatch_source_cancel(v17);

        [v5 setTimer:0];
      }
      int v18 = [v5 requestID];

      if (v18)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v20 = [v5 requestID];
          [v36 label];
          double v35 = v7;
          v34 = uint64_t v33 = v20;
          LogPrintF();
        }
        BOOL v24 = objc_msgSend(v5, "requestID", v33, v34, *(void *)&v35);
        uint64_t v25 = [v5 request];
        uint64_t v26 = [v5 xpcID];
        uint64_t v27 = [v5 options];
        uint64_t v28 = [v5 responseHandler];
        [v36 sendEncryptedRequestID:v24 request:v25 xpcID:v26 options:v27 responseHandler:v28];
      }
      else
      {
        id v21 = [v5 eventID];

        int v22 = self->_ucat->var0;
        if (v21)
        {
          if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
          {
            int v23 = [v5 eventID];
            [v36 label];
            v34 = uint64_t v33 = v23;
            LogPrintF();
          }
          int v29 = objc_msgSend(v5, "eventID", v33, v34);
          unint64_t v30 = [v5 eventData];
          unint64_t v31 = [v5 options];
          id v32 = [v5 completion];
          [v36 sendEncryptedEventID:v29 data:v30 xid:0 options:v31 completion:v32];
        }
        else if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }

      uint64_t v5 = [(NSMutableArray *)self->_sendArray firstObject];
    }
    while (v5);
  }
}

- (void)_receiveStart:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int var0 = self->_ucat->var0;
  if (self->_flowControlReadEnabled)
  {
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    a4->var1 = 1;
    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F5E1C8]);
    }
    [v8 setBufferBytes:a4];
    [v8 setBufferData:0];
    [v8 setMinLength:4];
    [v8 setMaxLength:4];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __52__RPConnection__receiveStart_readFrame_requestable___block_invoke;
    uint64_t v15 = &unk_1E605C450;
    uint64_t v16 = self;
    id v8 = v8;
    id v17 = v8;
    uint64_t v19 = a4;
    id v11 = v9;
    id v18 = v11;
    [v8 setCompletion:&v12];
    objc_msgSend(v11, "readWithRequest:", v8, v12, v13, v14, v15, v16);
    a4->var2 = 1;
  }
  else if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __52__RPConnection__receiveStart_readFrame_requestable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40) readFrame:*(void *)(a1 + 56) requestable:*(void *)(a1 + 48)];
}

- (void)_receiveCompletion:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  a4->var2 = 0;
  double v10 = [v8 error];
  if (v10)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v16 = MEMORY[0x1B3EBCC80](self->_readErrorHandler);
    id v17 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v10);
    }

    goto LABEL_27;
  }
  if (!a4->var1)
  {
    uint64_t v24 = 0;
    uint64_t v14 = [v8 length];
    uint64_t v23 = v14;
    int v15 = self->_ucat->var0;
    if (v15 <= 9 && (v15 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = v14;
      LogPrintF();
    }
    unint64_t v20 = v8;
    goto LABEL_26;
  }
  int v12 = self->_ucat->var0;
  uint64_t v13 = (a4->var0.var1[0] << 16) | (a4->var0.var1[1] << 8) | a4->var0.var1[2];
  if (!v13)
  {
    if (v12 <= 9 && (v12 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v23 = 0;
    uint64_t v24 = [v8 statusFlags] & 1;
    unint64_t v20 = (void *)MEMORY[0x1E4F1C9B8];
LABEL_26:
    id v21 = objc_msgSend(v20, "data", v22);
    [(RPConnection *)self _receivedHeader:a4 body:v21 ctx:&v23];

    [(RPConnection *)self _receiveStart:v8 readFrame:a4 requestable:v9];
    goto LABEL_27;
  }
  if (v12 <= 9 && (v12 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v22 = v13;
    LogPrintF();
  }
  a4->var1 = 0;
  objc_msgSend(v8, "setBufferBytes:", 0, v22);
  [v8 setBufferData:0];
  [v8 setMinLength:v13];
  [v8 setMaxLength:v13];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke;
  void v25[3] = &unk_1E605C450;
  v25[4] = self;
  id v18 = v8;
  id v26 = v18;
  uint64_t v28 = a4;
  id v19 = v9;
  id v27 = v19;
  [v18 setCompletion:v25];
  [v19 readWithRequest:v18];
  a4->var2 = 1;

LABEL_27:
}

uint64_t __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40) readFrame:*(void *)(a1 + 56) requestable:*(void *)(a1 + 48)];
}

- (void)_receivedHeader:(id *)a3 body:(id)a4 ctx:(id *)a5
{
  id v8 = a4;
  ++self->_receivedFrameCountCurrent;
  uint64_t var0 = a3->var0;
  int v10 = self->_ucat->var0;
  id v29 = v8;
  if (v10 <= 9)
  {
    if (v10 != -1 || (int v12 = _LogCategory_Initialize(), v8 = v29, v12))
    {
      if ((int)var0 <= 47)
      {
        id v11 = "Invalid";
        switch((int)var0)
        {
          case 0:
            goto LABEL_35;
          case 1:
            id v11 = "NoOp";
            break;
          case 3:
            id v11 = "PS_Start";
            break;
          case 4:
            id v11 = "PS_Next";
            break;
          case 5:
            id v11 = "PV_Start";
            break;
          case 6:
            id v11 = "PV_Next";
            break;
          case 7:
            id v11 = "U_OPACK";
            break;
          case 8:
            id v11 = "E_OPACK";
            break;
          case 9:
            id v11 = "P_OPACK";
            break;
          case 10:
            id v11 = "PA_Req";
            break;
          case 11:
            id v11 = "PA_Rsp";
            break;
          case 16:
            id v11 = "SessionStartRequest";
            break;
          case 17:
            id v11 = "SessionStartResponse";
            break;
          case 18:
            id v11 = "SessionData";
            break;
          case 32:
            id v11 = "FamilyIdentityRequest";
            break;
          case 33:
            id v11 = "FamilyIdentityResponse";
            break;
          case 34:
            id v11 = "FamilyIdentityUpdate";
            break;
          default:
            goto LABEL_34;
        }
        goto LABEL_35;
      }
      if ((int)var0 <= 63)
      {
        if (var0 == 48)
        {
          id v11 = "WatchIdentityRequest";
          goto LABEL_35;
        }
        if (var0 == 49)
        {
          id v11 = "WatchIdentityResponse";
          goto LABEL_35;
        }
      }
      else
      {
        switch(var0)
        {
          case '@':
            id v11 = "FriendIdentityRequest";
            goto LABEL_35;
          case 'A':
            id v11 = "FriendIdentityResponse";
            goto LABEL_35;
          case 'B':
            id v11 = "FriendIdentityUpdate";
LABEL_35:
            uint64_t v28 = [v8 length];
            id v26 = v11;
            id v27 = v29;
            uint64_t v25 = var0;
            LogPrintF();
            id v8 = v29;
            goto LABEL_36;
        }
      }
LABEL_34:
      id v11 = "?";
      goto LABEL_35;
    }
  }
LABEL_36:
  switch((int)var0)
  {
    case 1:
      break;
    case 3:
      if (!self->_clientMode)
      {
        id v17 = self;
        id v18 = v8;
        uint64_t v19 = 1;
        goto LABEL_61;
      }
      int v14 = self->_ucat->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
        goto LABEL_80;
      }
      break;
    case 4:
      if (self->_clientMode)
      {
        [(RPConnection *)self _clientPairSetupWithData:v8];
      }
      else
      {
        id v17 = self;
        id v18 = v8;
        uint64_t v19 = 0;
LABEL_61:
        -[RPConnection _serverPairSetupWithData:start:](v17, "_serverPairSetupWithData:start:", v18, v19, v25, v26, v27, v28);
      }
      break;
    case 5:
      if (!self->_clientMode)
      {
        unint64_t v20 = self;
        id v21 = v8;
        uint64_t v22 = 1;
        goto LABEL_64;
      }
      int v15 = self->_ucat->var0;
      if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize())) {
        goto LABEL_80;
      }
      break;
    case 6:
      if (self->_clientMode)
      {
        [(RPConnection *)self _clientPairVerifyWithData:v8];
      }
      else
      {
        unint64_t v20 = self;
        id v21 = v8;
        uint64_t v22 = 0;
LABEL_64:
        -[RPConnection _serverPairVerifyWithData:start:](v20, "_serverPairVerifyWithData:start:", v21, v22, v25, v26, v27, v28);
      }
      break;
    case 8:
    case 12:
      [(RPConnection *)self _receivedHeader:a3 encryptedObjectData:v29 ctx:a5];
      break;
    case 10:
      if (self->_clientMode)
      {
        int v16 = self->_ucat->var0;
        if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize())) {
          goto LABEL_80;
        }
      }
      else
      {
        [(RPConnection *)self _serverPreAuthRequestWithData:v8];
      }
      break;
    case 11:
      if (self->_clientMode)
      {
        [(RPConnection *)self _clientPreAuthResponseWithData:v8];
      }
      else
      {
        int v23 = self->_ucat->var0;
        if (v23 <= 60 && (v23 != -1 || _LogCategory_Initialize())) {
          goto LABEL_80;
        }
      }
      break;
    default:
      int v13 = self->_ucat->var0;
      if (v13 <= 60)
      {
        if (v13 != -1 || (int v24 = _LogCategory_Initialize(), v8 = v29, v24))
        {
          objc_msgSend(v8, "length", v25, v26, v27, v28);
LABEL_80:
          LogPrintF();
        }
      }
      break;
  }
  MEMORY[0x1F4181870]();
}

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4 ctx:(id *)a5
{
  id v8 = a4;
  int var0 = a3->var0;
  int v10 = self->_mainStream;
  if (var0 == 12)
  {
    id v11 = self->_highPriorityStream;

    int v10 = v11;
  }
  if (v10)
  {
    id v24 = 0;
    int v12 = [(CUPairingStream *)v10 decryptData:v8 aadBytes:a3 aadLength:4 error:&v24];
    id v13 = v24;
    if (v12)
    {
      uint64_t v14 = OPACKDecodeData();
      if (v14)
      {
        int v15 = (void *)v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = (objc_class *)objc_opt_class();
          int v23 = NSStringFromClass(v21);
          uint64_t v22 = RPErrorF();

          id v13 = (id)v22;
          goto LABEL_9;
        }
        int v16 = (void *)[v15 mutableCopy];
        id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        [v16 setObject:v17 forKeyedSubscript:&unk_1F0C37540];

        id v18 = v16;
        [(RPConnection *)self _receivedObject:v18 ctx:a5];
      }
      else
      {
        id v20 = RPErrorF();
      }
    }
  }
  else
  {
    RPErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (v13)
  {
    int v19 = self->_ucat->var0;
    if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_receivedObject:(id)a3 ctx:(id *)a4
{
  id v10 = a3;
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    [(RPConnection *)self _receivedResponse:v10 ctx:a4];
    goto LABEL_10;
  }
  if (Int64Ranged == 2)
  {
    [(RPConnection *)self _receivedRequest:v10 ctx:a4];
    goto LABEL_10;
  }
  double v7 = v10;
  if (Int64Ranged == 1)
  {
    [(RPConnection *)self _receivedEvent:v10 ctx:a4];
LABEL_10:
    double v7 = v10;
    goto LABEL_11;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v9 = _LogCategory_Initialize(), double v7 = v10, v9))
    {
      LogPrintF();
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)_receivedEvent:(id)a3 ctx:(id *)a4
{
  v71[16] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFDictionaryGetTypeID();
  double v7 = CFDictionaryGetTypedValue();
  if (v7)
  {
    CFStringGetTypeID();
    id v8 = CFDictionaryGetTypedValue();
    if (!v8)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_73;
    }
    uint64_t Int64 = CFDictionaryGetInt64();
    CFStringGetTypeID();
    id v10 = CFDictionaryGetTypedValue();
    if (v10 && !self->_clientMode)
    {
      inUseProcesses = self->_inUseProcesses;
      if (!inUseProcesses)
      {
        int v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v13 = self->_inUseProcesses;
        self->_inUseProcesses = v12;

        inUseProcesses = self->_inUseProcesses;
      }
      [(NSMutableSet *)inUseProcesses addObject:v10];
      int v14 = self->_ucat->var0;
      if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v56 = [(RPConnection *)self inUseProcessesToString];
        LogPrintF();
      }
    }
    id v17 = NSDictionaryGetNSNumber();
    uint64_t v18 = [v17 unsignedIntValue];
    if (!Int64)
    {
      id v19 = v8;
      if (([v19 isEqual:@"HIDRelay"] & 1) != 0
        || ([v19 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
        || ([v19 isEqual:@"_hidT"] & 1) != 0
        || [v19 isEqual:@"_laData"])
      {
      }
      else
      {
        int v55 = [v19 isEqual:@"_siA"];

        if (!v55)
        {
          int v20 = 30;
LABEL_28:
          int v21 = self->_ucat->var0;
          if (v20 >= v21 && (v21 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v58 = objc_msgSend(v7, "count", v56);
            peerIdentifier = self->_peerIdentifier;
            uint64_t v56 = v8;
            uint64_t v57 = v18;
            LogPrintF();
          }
          if (objc_msgSend(v8, "isEqual:", @"_systemInfoUpdate", v56, v57, v58, peerIdentifier))
          {
            [(RPConnection *)self _receivedSystemInfo:v7 xid:0];
          }
          else if (self->_receivedEventHandler)
          {
            uint64_t v22 = (__CFString *)self->_peerIdentifier;
            if (!v22) {
              uint64_t v22 = @"?";
            }
            int v23 = v22;
            if ([v8 isEqualToString:@"ids-message"]
              && ([(RPCompanionLinkDevice *)self->_peerDeviceInfo publicIdentifier],
                  id v24 = objc_claimAutoreleasedReturnValue(),
                  v24,
                  v24))
            {
              uint64_t v25 = [(RPCompanionLinkDevice *)self->_peerDeviceInfo publicIdentifier];

              id v69 = (void *)v25;
            }
            else
            {
              id v69 = v23;
            }
            peerDeviceInfo = self->_peerDeviceInfo;
            id receivedEventHandler = (void (**)(id, void *, void *, void *))self->_receivedEventHandler;
            v70[0] = @"dlt";
            id v27 = NSNumber;
            uint64_t linkType = self->_linkType;
            id v29 = peerDeviceInfo;
            id v68 = [v27 numberWithInt:linkType];
            v71[0] = v68;
            v70[1] = @"senderIDSCID";
            uint64_t v30 = [(RPEndpoint *)v29 idsCorrelationIdentifier];
            id v67 = (void *)v30;
            if (v30) {
              unint64_t v31 = (__CFString *)v30;
            }
            else {
              unint64_t v31 = &stru_1F0C22DA8;
            }
            v71[1] = v31;
            v70[2] = @"length";
            os_signpost_id_t v66 = [NSNumber numberWithUnsignedLong:a4->var0];
            v71[2] = v66;
            v70[3] = @"moreComing";
            uint64_t v32 = [NSNumber numberWithBool:a4->var1];
            uint64_t v64 = (void *)v32;
            peerAddrString = (__CFString *)self->_peerAddrString;
            peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
            if (!peerAddrString) {
              peerAddrString = &stru_1F0C22DA8;
            }
            v71[3] = v32;
            v71[4] = peerAddrString;
            v70[4] = @"peerAddr";
            v70[5] = @"peerHomeKitUserIdentifier";
            if (peerHomeKitUserIdentifier) {
              double v35 = (__CFString *)peerHomeKitUserIdentifier;
            }
            else {
              double v35 = &stru_1F0C22DA8;
            }
            v71[5] = v35;
            v70[6] = @"peerVerifiedIdentity";
            uint64_t v36 = [(RPEndpoint *)v29 verifiedIdentity];
            long long v63 = (void *)v36;
            if (v36) {
              int v37 = (__CFString *)v36;
            }
            else {
              int v37 = @"?";
            }
            selfAddrString = (__CFString *)self->_selfAddrString;
            if (!selfAddrString) {
              selfAddrString = &stru_1F0C22DA8;
            }
            v71[6] = v37;
            v71[7] = selfAddrString;
            v70[7] = @"selfAddr";
            v70[8] = @"senderAccountAltDSID";
            uint64_t v39 = [(RPEndpoint *)v29 accountAltDSID];
            double v62 = (void *)v39;
            if (v39) {
              uint64_t v40 = (__CFString *)v39;
            }
            else {
              uint64_t v40 = &stru_1F0C22DA8;
            }
            v71[8] = v40;
            v70[9] = @"senderAccountID";
            uint64_t v41 = [(RPEndpoint *)v29 accountID];
            unint64_t v61 = (void *)v41;
            if (v41) {
              BOOL v42 = (__CFString *)v41;
            }
            else {
              BOOL v42 = &stru_1F0C22DA8;
            }
            v71[9] = v42;
            v70[10] = @"senderDeviceName";
            uint64_t v43 = [(RPEndpoint *)v29 name];
            id v60 = (void *)v43;
            if (v43) {
              int v44 = (__CFString *)v43;
            }
            else {
              int v44 = &stru_1F0C22DA8;
            }
            v71[10] = v44;
            v71[11] = v69;
            v70[11] = @"senderID";
            v70[12] = @"senderIDS";
            uint64_t v45 = [(RPEndpoint *)v29 idsDeviceIdentifier];
            uint64_t v46 = (void *)v45;
            if (v45) {
              uint64_t v47 = (__CFString *)v45;
            }
            else {
              uint64_t v47 = @"?";
            }
            v71[12] = v47;
            v70[13] = @"senderModelID";
            uint64_t v48 = [(RPEndpoint *)v29 model];
            uint64_t v49 = (void *)v48;
            if (v48) {
              uint64_t v50 = (__CFString *)v48;
            }
            else {
              uint64_t v50 = @"?";
            }
            v71[13] = v50;
            v70[14] = @"statusFlags";
            uint64_t v51 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](v29, "statusFlags"));
            uint64_t v52 = (void *)v51;
            v70[15] = @"xid";
            uint64_t v53 = &unk_1F0C37558;
            if (v17) {
              uint64_t v53 = v17;
            }
            v71[14] = v51;
            v71[15] = v53;
            id v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:16];
            receivedEventHandler[2](receivedEventHandler, v8, v7, v54);
          }
LABEL_73:

          goto LABEL_74;
        }
      }
    }
    int v20 = 10;
    goto LABEL_28;
  }
  int v15 = self->_ucat->var0;
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_74:
}

- (void)_receivedRequest:(id)a3 ctx:(id *)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v93 = 0;
  double v7 = NSDictionaryGetNSNumber();
  uint64_t v8 = [v7 unsignedIntValue];
  if (v8)
  {
    uint64_t v9 = v8;
    CFStringGetTypeID();
    id v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      CFDictionaryGetTypeID();
      uint64_t v11 = CFDictionaryGetTypedValue();
      int v12 = (void *)v11;
      if (v11)
      {
        uint64_t v88 = (void *)v11;
        uint64_t Int64 = CFDictionaryGetInt64();
        BOOL v84 = Int64 != 0;
        uint64_t v13 = CFDictionaryGetInt64();
        BOOL v83 = v13 != 0;
        uint64_t v81 = CFDictionaryGetInt64();
        CFStringGetTypeID();
        uint64_t v14 = CFDictionaryGetTypedValue();
        if (v14 && !self->_clientMode)
        {
          inUseProcesses = self->_inUseProcesses;
          if (!inUseProcesses)
          {
            int v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v17 = self->_inUseProcesses;
            self->_inUseProcesses = v16;

            inUseProcesses = self->_inUseProcesses;
          }
          [(NSMutableSet *)inUseProcesses addObject:v14];
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            os_signpost_id_t v66 = [(RPConnection *)self inUseProcessesToString];
            LogPrintF();
          }
        }
        uint64_t v87 = (void *)v14;
        uint64_t v22 = RPConnectionLog();
        if (os_signpost_enabled(v22))
        {
          uint64_t v23 = [v10 UTF8String];
          label = self->_label;
          peerIdentifier = self->_peerIdentifier;
          *(_DWORD *)buf = 67109890;
          int v97 = v9;
          __int16 v98 = 2080;
          uint64_t v99 = v23;
          __int16 v100 = 2112;
          id v101 = label;
          __int16 v102 = 2112;
          BOOL v103 = peerIdentifier;
          _os_signpost_emit_with_name_impl(&dword_1B38EA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RPConnectionClientResponseTime", " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, peer:%@, signpost.description:begin_time}", buf, 0x26u);
        }

        id v26 = v10;
        id v27 = v26;
        if (v13)
        {
          int v28 = 10;
        }
        else if ([v26 isEqual:@"_ftSm"])
        {
          int v28 = 9;
        }
        else
        {
          int v28 = 9;
          if (([v27 isEqual:@"_ftLg"] & 1) == 0)
          {
            if ([v27 isEqual:@"_ftRs"]) {
              int v28 = 9;
            }
            else {
              int v28 = 30;
            }
          }
        }

        int v29 = self->_ucat->var0;
        if (v28 >= v29 && (v29 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v68 = objc_msgSend(v88, "count", v66);
          id v69 = self->_peerIdentifier;
          os_signpost_id_t v66 = v27;
          uint64_t v67 = v9;
          LogPrintF();
        }
        uint64_t v30 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
        if ([v27 isEqual:@"_ping"])
        {
          LOBYTE(v66) = v13 != 0;
          int v12 = v88;
          -[RPConnection _sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:](self, "_sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:", v88, 0, 0, v7, v27, Int64 != 0, v66, v30, v68, v69);
        }
        else if ([v27 isEqual:@"_systemInfo"])
        {
          int v12 = v88;
          [(RPConnection *)self _receivedSystemInfo:v88 xid:v7];
        }
        else
        {
          id receivedRequestHandler = (void (**)(id, void *, void *, void *, void *))self->_receivedRequestHandler;
          if (receivedRequestHandler)
          {
            BOOL v75 = v81 != 0;
            BOOL v32 = v13 != 0;
            peerDeviceInfo = self->_peerDeviceInfo;
            v94[0] = @"dlt";
            uint64_t v86 = v30;
            id v34 = NSNumber;
            uint64_t linkType = self->_linkType;
            uint64_t v77 = receivedRequestHandler;
            uint64_t v36 = peerDeviceInfo;
            int v82 = [v34 numberWithInt:linkType];
            v95[0] = v82;
            v94[1] = @"senderIDSCID";
            uint64_t v37 = [(RPEndpoint *)v36 idsCorrelationIdentifier];
            id v80 = (void *)v37;
            if (v37) {
              unint64_t v38 = (__CFString *)v37;
            }
            else {
              unint64_t v38 = &stru_1F0C22DA8;
            }
            v95[1] = v38;
            v94[2] = @"length";
            uint64_t v79 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", a4->var0, v66, v67, v68, v69);
            v95[2] = v79;
            v94[3] = @"chatty";
            long long v78 = [NSNumber numberWithBool:v32];
            v95[3] = v78;
            v94[4] = @"moreComing";
            uint64_t v39 = [NSNumber numberWithBool:a4->var1];
            long long v76 = (void *)v39;
            peerAddrString = (__CFString *)self->_peerAddrString;
            peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
            if (!peerAddrString) {
              peerAddrString = &stru_1F0C22DA8;
            }
            v95[4] = v39;
            v95[5] = peerAddrString;
            v94[5] = @"peerAddr";
            v94[6] = @"peerHomeKitUserIdentifier";
            if (peerHomeKitUserIdentifier) {
              BOOL v42 = (__CFString *)peerHomeKitUserIdentifier;
            }
            else {
              BOOL v42 = &stru_1F0C22DA8;
            }
            v95[6] = v42;
            v94[7] = @"peerVerifiedIdentity";
            uint64_t v43 = [(RPEndpoint *)self->_peerDeviceInfo verifiedIdentity];
            id v74 = (void *)v43;
            if (v43) {
              int v44 = (__CFString *)v43;
            }
            else {
              int v44 = @"?";
            }
            selfAddrString = (__CFString *)self->_selfAddrString;
            if (!selfAddrString) {
              selfAddrString = &stru_1F0C22DA8;
            }
            v95[7] = v44;
            v95[8] = selfAddrString;
            v94[8] = @"selfAddr";
            v94[9] = @"senderAccountAltDSID";
            uint64_t v46 = v36;
            uint64_t v47 = [(RPEndpoint *)v36 accountAltDSID];
            id v73 = (void *)v47;
            if (v47) {
              uint64_t v48 = (__CFString *)v47;
            }
            else {
              uint64_t v48 = &stru_1F0C22DA8;
            }
            v95[9] = v48;
            v94[10] = @"senderAccountID";
            uint64_t v49 = [(RPEndpoint *)v36 accountID];
            BOOL v72 = (void *)v49;
            if (v49) {
              uint64_t v50 = (__CFString *)v49;
            }
            else {
              uint64_t v50 = &stru_1F0C22DA8;
            }
            v95[10] = v50;
            v94[11] = @"senderDeviceName";
            uint64_t v71 = v36;
            uint64_t v51 = [(RPEndpoint *)v36 name];
            id v70 = (void *)v51;
            if (v51) {
              uint64_t v52 = (__CFString *)v51;
            }
            else {
              uint64_t v52 = &stru_1F0C22DA8;
            }
            uint64_t v53 = (__CFString *)self->_peerIdentifier;
            if (!v53) {
              uint64_t v53 = @"?";
            }
            v95[11] = v52;
            v95[12] = v53;
            v94[12] = @"senderID";
            v94[13] = @"senderIDS";
            uint64_t v54 = [(RPEndpoint *)v36 idsDeviceIdentifier];
            int v55 = (void *)v54;
            if (v54) {
              uint64_t v56 = (__CFString *)v54;
            }
            else {
              uint64_t v56 = @"?";
            }
            v95[13] = v56;
            v94[14] = @"senderModelID";
            uint64_t v57 = [(RPEndpoint *)v36 model];
            uint64_t v58 = (void *)v57;
            if (v57) {
              os_signpost_id_t v59 = (__CFString *)v57;
            }
            else {
              os_signpost_id_t v59 = @"?";
            }
            v95[14] = v59;
            v94[15] = @"statusFlags";
            id v60 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](v46, "statusFlags"));
            v95[15] = v60;
            v95[16] = v7;
            v94[16] = @"xid";
            v94[17] = @"_pttEligible";
            unint64_t v61 = [NSNumber numberWithBool:v75];
            v95[17] = v61;
            double v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:18];
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __37__RPConnection__receivedRequest_ctx___block_invoke;
            v89[3] = &unk_1E605C478;
            v89[4] = self;
            v89[5] = v27;
            v89[6] = v7;
            BOOL v91 = v84;
            BOOL v92 = v83;
            id v90 = v86;
            v77[2](v77, v27, v88, v62, v89);

            uint64_t v30 = v86;
            int v12 = v88;
          }
          else
          {
            long long v63 = v30;
            int v64 = self->_ucat->var0;
            if (v64 <= 90 && (v64 != -1 || _LogCategory_Initialize()))
            {
              os_signpost_id_t v66 = v27;
              LogPrintF();
            }
            id v65 = RPErrorF();
            LOBYTE(v66) = v13 != 0;
            [(RPConnection *)self _sendEncryptedResponse:0 options:0 error:v65 xid:v7 requestID:v27 highPriority:Int64 != 0 isChatty:v66 replyStartTime:v63];

            uint64_t v30 = v63;
            int v12 = v88;
          }
        }
      }
      else
      {
        int v21 = self->_ucat->var0;
        if (v21 <= 90 && (v21 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    else
    {
      int v20 = self->_ucat->var0;
      if (v20 <= 90 && (v20 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  else
  {
    int v19 = self->_ucat->var0;
    if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void __37__RPConnection__receivedRequest_ctx___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 80))
  {
    int v10 = **(_DWORD **)(v9 + 296);
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    LOBYTE(v11) = *(unsigned char *)(a1 + 65);
    [(id)v9 _sendEncryptedResponse:v12 options:v7 error:v8 xid:*(void *)(a1 + 48) requestID:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 64) isChatty:v11 replyStartTime:*(void *)(a1 + 56)];
  }
}

- (void)_receivedResponse:(id)a3 ctx:(id *)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = NSDictionaryGetNSNumber();
  uint64_t v8 = [v7 unsignedIntValue];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v7];
    if (v10)
    {
      [(NSMutableDictionary *)self->_requests setObject:0 forKeyedSubscript:v7];
      uint64_t v11 = [v10 requestID];
      id v12 = [v10 options];
      uint64_t v13 = [v10 timer];
      [v10 setTimer:0];
      if (v13) {
        dispatch_source_cancel(v13);
      }
      CFDictionaryGetTypeID();
      uint64_t v14 = CFDictionaryGetTypedValue();
      int v15 = (void *)v14;
      if (v14)
      {
        BOOL v84 = (void *)v14;
        mach_absolute_time();
        [v10 sendTicks];
        uint64_t v82 = UpTicksToMilliseconds();
        uint64_t v83 = RPDecodeNSError(v6);
        if (v83)
        {
          int var0 = self->_ucat->var0;
          id v17 = (void *)v83;
          int v15 = v84;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            peerIdentifier = self->_peerIdentifier;
            uint64_t v66 = v82;
            uint64_t v63 = v9;
            uint64_t v64 = v83;
            LogPrintF();
          }
          objc_msgSend(v10, "responseHandler", v63, v64, peerIdentifier, v66);
          int v29 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          v29[2](v29, 0, 0, v83);
        }
        else
        {
          uint64_t v77 = v13;
          uint64_t Int64 = CFDictionaryGetInt64();
          uint64_t v21 = CFDictionaryGetInt64();
          uint64_t v22 = RPConnectionLog();
          long long v78 = v11;
          uint64_t v79 = v12;
          if (os_signpost_enabled(v22))
          {
            label = self->_label;
            uint64_t v24 = [v10 length];
            uint64_t v25 = self->_peerIdentifier;
            *(_DWORD *)buf = 67110402;
            int v88 = v9;
            __int16 v89 = 2112;
            id v90 = label;
            id v12 = v79;
            __int16 v91 = 2048;
            uint64_t v92 = v82;
            __int16 v93 = 2048;
            uint64_t v94 = v24;
            __int16 v95 = 2048;
            uint64_t v96 = Int64;
            __int16 v97 = 2112;
            __int16 v98 = v25;
            _os_signpost_emit_with_name_impl(&dword_1B38EA000, v22, OS_SIGNPOST_INTERVAL_END, v9, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, rtt:%llu, requestSize:%zu, responseSize:%zu, peer:%@, signpost.description:end_time}", buf, 0x3Au);
          }

          id v26 = v11;
          id v27 = v26;
          if (v21)
          {
            int v28 = 10;
          }
          else if ([v26 isEqual:@"_ftSm"])
          {
            int v28 = 9;
          }
          else
          {
            int v28 = 9;
            if (([v27 isEqual:@"_ftLg"] & 1) == 0)
            {
              if ([v27 isEqual:@"_ftRs"]) {
                int v28 = 9;
              }
              else {
                int v28 = 30;
              }
            }
          }

          int v30 = self->_ucat->var0;
          if (v28 >= v30 && (v30 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v31 = [v84 count];
            BOOL v32 = self->_peerIdentifier;
            uint64_t v67 = [v10 length];
            uint64_t v68 = Int64;
            peerIdentifier = v32;
            uint64_t v66 = v82;
            uint64_t v63 = v9;
            uint64_t v64 = v31;
            LogPrintF();
            id v12 = v79;
          }
          uint64_t v33 = objc_msgSend(v12, "objectForKeyedSubscript:", @"nwActivityMetrics", v63, v64, peerIdentifier, v66, v67, v68);
          id v34 = v33;
          if (v33)
          {
            [v33 setResponseSize:Int64];
            *(_DWORD *)buf = 0;
            uint64_t v35 = CFDictionaryGetInt64();
            if (!*(_DWORD *)buf) {
              [v34 setReplyTime:v35];
            }
            [v34 submitMetrics];
          }
          uint64_t v36 = self->_peerDeviceInfo;
          id v80 = [v10 responseHandler];
          v85[0] = @"dlt";
          BOOL v75 = [NSNumber numberWithInt:self->_linkType];
          v86[0] = v75;
          v85[1] = @"senderIDSCID";
          uint64_t v37 = [(RPEndpoint *)v36 idsCorrelationIdentifier];
          id v74 = (void *)v37;
          if (v37) {
            unint64_t v38 = (__CFString *)v37;
          }
          else {
            unint64_t v38 = &stru_1F0C22DA8;
          }
          v86[1] = v38;
          v85[2] = @"length";
          uint64_t v39 = [NSNumber numberWithUnsignedLong:a4->var0];
          id v73 = (void *)v39;
          peerAddrString = (__CFString *)self->_peerAddrString;
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          if (!peerAddrString) {
            peerAddrString = &stru_1F0C22DA8;
          }
          v86[2] = v39;
          v86[3] = peerAddrString;
          v85[3] = @"peerAddr";
          v85[4] = @"peerHomeKitUserIdentifier";
          if (peerHomeKitUserIdentifier) {
            BOOL v42 = (__CFString *)peerHomeKitUserIdentifier;
          }
          else {
            BOOL v42 = &stru_1F0C22DA8;
          }
          selfAddrString = (__CFString *)self->_selfAddrString;
          if (!selfAddrString) {
            selfAddrString = &stru_1F0C22DA8;
          }
          v86[4] = v42;
          v86[5] = selfAddrString;
          v85[5] = @"selfAddr";
          v85[6] = @"peerVerifiedIdentity";
          uint64_t v44 = [(RPEndpoint *)v36 verifiedIdentity];
          BOOL v72 = (void *)v44;
          long long v76 = (void (**)(void, void, void, void))v34;
          if (v44) {
            uint64_t v45 = (__CFString *)v44;
          }
          else {
            uint64_t v45 = @"?";
          }
          v86[6] = v45;
          v85[7] = @"senderAccountAltDSID";
          uint64_t v46 = [(RPEndpoint *)v36 accountAltDSID];
          uint64_t v71 = (void *)v46;
          if (v46) {
            uint64_t v47 = (__CFString *)v46;
          }
          else {
            uint64_t v47 = &stru_1F0C22DA8;
          }
          v86[7] = v47;
          v85[8] = @"senderAccountID";
          uint64_t v48 = [(RPEndpoint *)v36 accountID];
          id v70 = (void *)v48;
          if (v48) {
            uint64_t v49 = (__CFString *)v48;
          }
          else {
            uint64_t v49 = &stru_1F0C22DA8;
          }
          v86[8] = v49;
          v85[9] = @"senderDeviceName";
          uint64_t v50 = [(RPEndpoint *)v36 name];
          id v69 = (void *)v50;
          if (v50) {
            uint64_t v51 = (__CFString *)v50;
          }
          else {
            uint64_t v51 = &stru_1F0C22DA8;
          }
          uint64_t v52 = (__CFString *)self->_peerIdentifier;
          if (!v52) {
            uint64_t v52 = @"?";
          }
          v86[9] = v51;
          v86[10] = v52;
          v85[10] = @"senderID";
          v85[11] = @"senderIDS";
          uint64_t v53 = [(RPEndpoint *)v36 idsDeviceIdentifier];
          uint64_t v54 = (void *)v53;
          if (v53) {
            int v55 = (__CFString *)v53;
          }
          else {
            int v55 = @"?";
          }
          v86[11] = v55;
          v85[12] = @"senderModelID";
          uint64_t v56 = [(RPEndpoint *)v36 model];
          uint64_t v57 = (void *)v56;
          if (v56) {
            uint64_t v58 = (__CFString *)v56;
          }
          else {
            uint64_t v58 = @"?";
          }
          v86[12] = v58;
          v85[13] = @"statusFlags";
          os_signpost_id_t v59 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](v36, "statusFlags"));
          v85[14] = @"xid";
          v86[13] = v59;
          v86[14] = v7;
          id v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:15];
          ((void (**)(void, void *, void *, void))v80)[2](v80, v84, v60, 0);

          id v12 = v79;
          unint64_t v61 = +[RPConnectionMetrics sharedMetrics];
          uint64_t linkType = self->_linkType;

          int v15 = v84;
          objc_msgSend(v61, "logRequestOnLinkType:length:rtt:", linkType, objc_msgSend(v10, "length") + Int64, v82);

          int v29 = v76;
          uint64_t v13 = v77;
          uint64_t v11 = v78;
          id v17 = 0;
        }
      }
      else
      {
        int v20 = self->_ucat->var0;
        if (v20 <= 90 && (v20 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    else
    {
      int v19 = self->_ucat->var0;
      if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  else
  {
    int v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_abortRequestsWithError:(id)a3
{
  id v4 = a3;
  requests = self->_requests;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __40__RPConnection__abortRequestsWithError___block_invoke;
  int v10 = &unk_1E605C4A0;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)requests enumerateKeysAndObjectsUsingBlock:&v7];
  [(NSMutableDictionary *)self->_requests removeAllObjects];
}

void __40__RPConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 296);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v11 unsignedIntValue];
    uint64_t v10 = *(void *)(a1 + 40);
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(v5, "timer", v9, v10);
  [v5 setTimer:0];
  if (v7) {
    dispatch_source_cancel(v7);
  }
  uint64_t v8 = [v5 responseHandler];
  [v5 setResponseHandler:0];
  if (v8) {
    v8[2](v8, 0, 0, *(void *)(a1 + 40));
  }
}

- (void)_timeoutForSendEntry:(id)a3
{
  id v15 = a3;
  id v4 = [v15 xidObj];
  if (v4)
  {
    [(RPConnection *)self _timeoutForXID:v4];
    goto LABEL_15;
  }
  mach_absolute_time();
  [v15 queueTicks];
  UpTicksToSecondsF();
  uint64_t v6 = v5;
  uint64_t v7 = [(NSMutableArray *)self->_sendArray indexOfObject:v15];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_sendArray removeObjectAtIndex:v7];
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      id v11 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_13;
        }
        id v11 = v15;
      }
      [v11 requestID];
      v13 = uint64_t v14 = v6;
      LogPrintF();
    }
LABEL_13:
    objc_msgSend(v15, "responseHandler", v13, v14);
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    id v12 = RPErrorF();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0, 0, v12);

    goto LABEL_14;
  }
  int v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v15 requestID];
    LogPrintF();
LABEL_14:
  }
LABEL_15:
}

- (void)_timeoutForXID:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 unsignedIntValue];
  uint64_t v5 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v14];
  if (v5)
  {
    [(NSMutableDictionary *)self->_requests setObject:0 forKeyedSubscript:v14];
    mach_absolute_time();
    [v5 sendTicks];
    UpTicksToSecondsF();
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      uint64_t v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        uint64_t v13 = v8;
        uint64_t v12 = v4;
        LogPrintF();
      }
    }
    objc_msgSend(v5, "responseHandler", v12, v13);
    uint64_t v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    id v11 = RPErrorF();
    ((void (**)(void, void, void, void *))v10)[2](v10, 0, 0, v11);
  }
  else
  {
    int v9 = self->_ucat->var0;
    if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)_identityProofDataClient
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_pairVerifySession;
  uint64_t v4 = v3;
  if (v3)
  {
    if (![(CUPairingSession *)v3 deriveKeyWithSaltPtr:"IdentityProofClient-Salt" saltLen:24 infoPtr:"IdentityProofClient-Info" infoLen:24 keyLen:32 outputKeyPtr:__s])
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:__s length:32];
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      goto LABEL_9;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (id)_identityProofDataServer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_pairVerifySession;
  uint64_t v4 = v3;
  if (v3)
  {
    if (![(CUPairingSession *)v3 deriveKeyWithSaltPtr:"IdentityProofServer-Salt" saltLen:24 infoPtr:"IdentityProofServer-Info" infoLen:24 keyLen:32 outputKeyPtr:__s])
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:__s length:32];
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      goto LABEL_9;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (void)_identityProofsAdd:(id)a3 update:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self->_identityDaemon;
  if (v7)
  {
    if (self->_clientMode) {
      [(RPConnection *)self _identityProofDataClient];
    }
    else {
    uint64_t v8 = [(RPConnection *)self _identityProofDataServer];
    }
    if (v8)
    {
      if (!a4)
      {
        uint64_t v9 = [(RPIdentityDaemon *)v7 identityOfSelfAndReturnError:0];
        uint64_t v10 = v9;
        if (v9)
        {
          id v24 = 0;
          id v11 = [v9 signData:v8 error:&v24];
          id v12 = v24;
          int var0 = self->_ucat->var0;
          if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
          {
            id v21 = v12;
            LogPrintF();
          }
          if (v11) {
            [v6 setObject:v11 forKeyedSubscript:@"_sigRP"];
          }
        }
        if ((self->_statusFlags & 0x8000) == 0)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __42__RPConnection__identityProofsAdd_update___block_invoke;
          v23[3] = &unk_1E605C4C8;
          v23[4] = self;
          v23[5] = v8;
          id v14 = (void *)MEMORY[0x1B3EBCC80](v23);
          [(RPIdentityDaemon *)v7 getPairedIdentityWithCompletion:v14];
        }
      }
      id v15 = [(RPIdentityDaemon *)v7 homeKitIdentity];
      int v16 = v15;
      if (v15)
      {
        id v22 = 0;
        id v17 = [v15 signData:v8 error:&v22];
        id v18 = v22;
        int v19 = self->_ucat->var0;
        if (v19 < 31 && (v19 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (v17)
        {
          int v20 = [v16 identifier];
          [v6 setObject:v20 forKeyedSubscript:@"_idHKU"];

          [v6 setObject:v17 forKeyedSubscript:@"_sigHKU"];
        }
      }
    }
  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke(int8x16_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5 && !a3)
  {
    uint64_t v7 = *(NSObject **)(a1[2].i64[0] + 552);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__RPConnection__identityProofsAdd_update___block_invoke_2;
    block[3] = &unk_1E605C3D8;
    id v9 = v5;
    int8x16_t v10 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v7, block);
  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  id v5 = [v3 signData:v4 error:&v10];
  id v6 = v10;
  int v7 = **(_DWORD **)(*(void *)(a1 + 48) + 296);
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v6;
    uint64_t v9 = [v5 length];
    LogPrintF();
  }
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"_sigPD"];
  }
  if (objc_msgSend(v2, "count", v8, v9)) {
    [*(id *)(a1 + 48) sendEncryptedEventID:@"_systemInfoUpdate" event:v2 options:0 completion:0];
  }
}

- (void)_identityProofsAddWithHomeKitUUID:(id)a3
{
  id v4 = a3;
  id v5 = self->_identityDaemon;
  if (v5)
  {
    if (self->_clientMode) {
      [(RPConnection *)self _identityProofDataClient];
    }
    else {
    id v6 = [(RPConnection *)self _identityProofDataServer];
    }
    if (v6)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _DWORD v8[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke;
      v8[3] = &unk_1E605C4C8;
      v8[4] = self;
      v8[5] = v6;
      [(RPIdentityDaemon *)v5 getPairingIdentityFromHomeWithAccessory:v4 completion:v8];
    }
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = a1[2].i64[0];
  if (!v5 || v6)
  {
    int v10 = **(_DWORD **)(v8 + 296);
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v9 = *(NSObject **)(v8 + 552);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2;
    block[3] = &unk_1E605C3D8;
    id v12 = v5;
    int8x16_t v13 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v9, block);
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  id v4 = [v2 signData:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    int v6 = **(_DWORD **)(*(void *)(a1 + 48) + 296);
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v5;
      LogPrintF();
    }
    int v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v10);
    uint64_t v8 = [*(id *)(a1 + 32) identifier];
    [v7 setObject:v8 forKeyedSubscript:@"_idHKU"];

    [v7 setObject:v4 forKeyedSubscript:@"_sigHKU"];
    uint64_t v9 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3;
    v11[3] = &unk_1E605B5B0;
    v11[4] = v9;
    [v9 sendEncryptedEventID:@"_systemInfoUpdate" event:v7 options:0 completion:v11];
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 296);
    if (v4 <= 30)
    {
      id v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v6, v5))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
}

- (void)_identityProofsVerify:(id)a3
{
  id v19 = a3;
  int v4 = self->_identityDaemon;
  if (v4)
  {
    if (self->_clientMode) {
      [(RPConnection *)self _identityProofDataServer];
    }
    else {
    int v5 = [(RPConnection *)self _identityProofDataClient];
    }
    if ((self->_statusFlags & 0x24000) == 0)
    {
      CFDataGetTypeID();
      uint64_t v6 = CFDictionaryGetTypedValue();
      int v7 = (void *)v6;
      if (v5)
      {
        if (v6)
        {
          objc_storeStrong((id *)&self->_identityKeyData, v5);
          objc_storeStrong((id *)&self->_identitySignature, v7);
          unsigned int v8 = [(RPIdentityDaemon *)v4 resolveIdentityTypesForSignature:v7 data:v5 typeFlags:3112];
          unint64_t v9 = ((v8 << 11) & 0x4000 | (((v8 >> 5) & 1) << 17)) & 0xFFFFFFCFFFFFFFFFLL | ((((unint64_t)(v8 & 0xC00) >> 10) & 3) << 36);
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:v9 | [(RPEndpoint *)self->_peerDeviceInfo statusFlags]];
          self->_statusFlags |= v9;
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
    }
    CFDataGetTypeID();
    uint64_t v11 = CFDictionaryGetTypedValue();
    id v12 = (void *)v11;
    if (v5 && v11 && (self->_statusFlags & 0x8000) == 0)
    {
      int8x16_t v13 = [(RPIdentityDaemon *)v4 resolveIdentityForSignature:v11 data:v5 typeFlags:128 error:0];
      if (v13)
      {
        [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x8000];
        id v14 = [v13 acl];
        [(RPEndpoint *)self->_peerDeviceInfo setVerifiedAcl:v14];

        self->_statusFlags |= 0x8000uLL;
        int v15 = self->_ucat->var0;
        if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    CFStringGetTypeID();
    int v16 = CFDictionaryGetTypedValue();
    CFDataGetTypeID();
    uint64_t v17 = CFDictionaryGetTypedValue();
    id v18 = (void *)v17;
    if (v16 && v17)
    {
      objc_storeStrong((id *)&self->_homeKitIdentityIdentifier, v16);
      objc_storeStrong((id *)&self->_homeKitIdentitySignature, v18);
      [(RPConnection *)self _identityProofsVerifyHomeKitSignature:v18 identifier:v16];
    }
  }
}

- (void)_identityProofsVerifyHomeKitSignature:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((self->_statusFlags & 0x80000) != 0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unsigned int v8 = [(RPIdentityDaemon *)self->_identityDaemon homeKitIdentity];
    if (v8)
    {
      if (self->_clientMode) {
        [(RPConnection *)self _identityProofDataServer];
      }
      else {
      unint64_t v9 = [(RPConnection *)self _identityProofDataClient];
      }
      if (v9)
      {
        id v25 = 0;
        int v10 = [v8 verifySignature:v6 data:v9 error:&v25];
        id v11 = v25;
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (v10)
        {
          [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:[(RPEndpoint *)self->_peerDeviceInfo statusFlags] | 0x80000];
          self->_statusFlags |= 0x80000uLL;
          int8x16_t v13 = [v8 identifier];
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v13;

          uint64_t v15 = MEMORY[0x1B3EBCC80](self->_peerUpdatedHandler);
          int v16 = (void *)v15;
          if (v15) {
            (*(void (**)(uint64_t))(v15 + 16))(v15);
          }
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  if (self->_homeKitManager)
  {
    int v17 = self->_ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F5E180]);
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    [v18 setIdentifier:v19];

    homeKitManager = self->_homeKitManager;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke;
    v21[3] = &unk_1E605C4F0;
    v21[4] = self;
    id v22 = v7;
    id v23 = v9;
    id v24 = v6;
    [(CUHomeKitManager *)homeKitManager findPairedPeer:v18 options:32 completion:v21];
  }
}

void __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v10 = **(_DWORD **)(a1[4] + 296);
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    unsigned int v8 = (void *)a1[6];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v11 = (unsigned char *)a1[4];
      if (v11[328]) {
        [v11 _identityProofDataServer];
      }
      else {
      id v9 = [v11 _identityProofDataClient];
      }
      if (!v9) {
        goto LABEL_25;
      }
    }
    id v12 = objc_alloc_init(RPIdentity);
    int8x16_t v13 = [v5 publicKey];
    [(RPIdentity *)v12 setEdPKData:v13];

    uint64_t v14 = a1[7];
    id v24 = 0;
    BOOL v15 = [(RPIdentity *)v12 verifySignature:v14 data:v9 error:&v24];
    id v16 = v24;
    int v17 = **(_DWORD **)(a1[4] + 296);
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v15)
    {
      objc_msgSend(*(id *)(a1[4] + 672), "setStatusFlags:", objc_msgSend(*(id *)(a1[4] + 672), "statusFlags") | 0x2000);
      *(void *)(a1[4] + 768) |= 0x2000uLL;
      uint64_t v18 = a1[4];
      if (!*(void *)(v18 + 64))
      {
        uint64_t v19 = [v5 identifierStr];
        uint64_t v20 = a1[4];
        id v21 = *(void **)(v20 + 64);
        *(void *)(v20 + 64) = v19;

        uint64_t v18 = a1[4];
      }
      uint64_t v22 = MEMORY[0x1B3EBCC80](*(void *)(v18 + 688));
      id v23 = (void *)v22;
      if (v22) {
        (*(void (**)(uint64_t))(v22 + 16))(v22);
      }
    }
  }
LABEL_25:
}

- (void)_idleTimerStart:(unsigned int)a3 repeat:(unsigned int)a4
{
  self->_receivedFrameCountLast = self->_receivedFrameCountCurrent;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    id v7 = idleTimer;
    dispatch_source_cancel(v7);
    unsigned int v8 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  int v10 = self->_idleTimer;
  self->_idleTimer = v9;
  id v11 = v9;

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__RPConnection__idleTimerStart_repeat___block_invoke;
  handler[3] = &unk_1E605B5D8;
  handler[4] = v11;
  void handler[5] = self;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet();
  dispatch_activate(v11);
}

void *__39__RPConnection__idleTimerStart_repeat___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[11]) {
    return (void *)[result _idleTimerFired];
  }
  return result;
}

- (void)_idleTimerFired
{
  unint64_t receivedFrameCountCurrent = self->_receivedFrameCountCurrent;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (receivedFrameCountCurrent == self->_receivedFrameCountLast)
  {
    RPErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(RPConnection *)self _invalidateWithError:v5];
  }
  else
  {
    self->_receivedFrameCountLast = receivedFrameCountCurrent;
  }
}

- (BOOL)_receivedSystemInfo:(id)a3 xid:(id)a4
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t statusFlags = self->_statusFlags;
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0) {
    [(RPConnection *)self _identityProofsVerify:v6];
  }
  int v134 = 0;
  if ((statusFlags & 0x10000AE000) != 0)
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      [(RPEndpoint *)self->_peerDeviceInfo setAccountAltDSID:v9];
    }
    CFStringGetTypeID();
    int v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      [(RPEndpoint *)self->_peerDeviceInfo setAccountID:v10];
    }
  }
  [(RPEndpoint *)self->_peerDeviceInfo setActivityLevel:CFDictionaryGetInt64Ranged()];
  uint64_t v100 = statusFlags & 0x10000AE000;
  CFStringGetTypeID();
  id v11 = CFDictionaryGetTypedValue();
  if (v11) {
    objc_storeStrong((id *)&self->_appID, v11);
  }
  CFDictionaryGetTypeID();
  id v12 = CFDictionaryGetTypedValue();
  if (v12) {
    objc_storeStrong((id *)&self->_appInfoPeer, v12);
  }

  unsigned int Int64 = CFDictionaryGetInt64();
  unsigned int v133 = 0;
  unsigned int v133 = [(RPCompanionLinkDevice *)self->_peerDeviceInfo flags];
  RPCompanionLinkFlagsWithUpdateBonjourFlags(&v133, Int64);
  [(RPCompanionLinkDevice *)self->_peerDeviceInfo setFlags:v133];
  uint64_t v14 = statusFlags & 0x10000AE000;
  if (v100 || (self->_statusFlags & 0x2000000000) != 0)
  {
    CFStringGetTypeID();
    BOOL v15 = CFDictionaryGetTypedValue();

    if (v15 || v134 == -6756) {
      [(RPConnection *)self setServiceType:v15];
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v92 = v15;
      LogPrintF();
    }
    if (v100)
    {
      __int16 Int64Ranged = CFDictionaryGetInt64Ranged();
      if (!v134) {
        [(RPCompanionLinkDevice *)self->_peerDeviceInfo setFlags:[(RPCompanionLinkDevice *)self->_peerDeviceInfo flags] & 0xFFFFFD7F | Int64Ranged & 0x280];
      }
    }
  }
  else
  {
    BOOL v15 = v11;
  }
  __int16 v18 = CFDictionaryGetInt64();
  if ((v18 & 0x200) != 0) {
    self->_controlFlags |= v18 & 0x200;
  }
  if (!v100)
  {
LABEL_32:
    if ((statusFlags & 0x80000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_35;
  }
  CFStringGetTypeID();
  uint64_t v19 = CFDictionaryGetTypedValue();

  if (!v19 && v134 != -6756)
  {
    BOOL v15 = 0;
    goto LABEL_32;
  }
  -[RPCompanionLinkDevice setDeviceColor:](self->_peerDeviceInfo, "setDeviceColor:", v19, v92);
  BOOL v15 = (void *)v19;
  if ((statusFlags & 0x80000) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  CFStringGetTypeID();
  uint64_t v20 = CFDictionaryGetTypedValue();

  if (v20 || v134 == -6756)
  {
    -[RPCompanionLinkDevice setRole:](self->_peerDeviceInfo, "setRole:", v20, v92);
    BOOL v15 = (void *)v20;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_39:
  int v98 = statusFlags;
  if (v100)
  {
    id v21 = NSDictionaryGetNSUUID();
    if (v21)
    {
      [(RPCompanionLinkDevice *)self->_peerDeviceInfo setHomeKitIdentifier:v21];
      uint64_t v22 = [(RPCompanionLinkDevice *)self->_peerDeviceInfo homeKitIdentifier];
      [(RPConnection *)self _identityProofsAddWithHomeKitUUID:v22];
    }
    unsigned int v133 = 0;
    objc_opt_class();
    id v23 = NSDictionaryGetNSArrayOfClass();
    if (v23 && self->_homeKitUserIdentifierHandler)
    {
      [(RPEndpoint *)self->_peerDeviceInfo setHomeKitUserIdentifiers:v23];
      uint64_t v24 = MEMORY[0x1B3EBCC80](self->_homeKitUserIdentifierHandler);
      unint64_t statusFlags = v24;
      if (v24) {
        (*(void (**)(uint64_t))(v24 + 16))(v24);
      }

      LODWORD(statusFlags) = v98;
    }

    uint64_t v14 = v100;
  }
  else
  {
    id v21 = 0;
  }
  if (self->_identifierOverride)
  {
    if (v14) {
      goto LABEL_51;
    }
LABEL_60:
    BOOL v26 = 0;
    id v25 = 0;
    goto LABEL_61;
  }
  CFStringGetTypeID();
  id v27 = CFDictionaryGetTypedValue();

  if (v27)
  {
    [(RPEndpoint *)self->_peerDeviceInfo setIdentifier:v27];
    objc_storeStrong((id *)&self->_peerIdentifier, v27);
    BOOL v15 = v27;
  }
  else
  {
    BOOL v15 = 0;
  }
  uint64_t v14 = v100;
  if (!v100) {
    goto LABEL_60;
  }
LABEL_51:
  CFStringGetTypeID();
  id v25 = (id)CFDictionaryGetTypedValue();
  BOOL v26 = v25 != 0;
  if ((statusFlags & 0x80000) == 0 || !v25)
  {
LABEL_61:
    uint64_t v99 = v25;
    if ((self->_statusFlags & 0x2000) != 0)
    {
      int DeviceClass = GestaltGetDeviceClass();
      if (RPDeviceIsCommunal(DeviceClass))
      {
        int v29 = self->_ucat->var0;
        if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:](self->_identityDaemon, "addSharedHomeIdentityWithRPMessage:", v6, v99);
        }
        else
        {
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:](self->_identityDaemon, "addSharedHomeIdentityWithRPMessage:", v6, v92);
        }
      }
    }
    if (v14) {
      goto LABEL_74;
    }
LABEL_86:
    if (!v14) {
      goto LABEL_110;
    }
    goto LABEL_87;
  }
  if (!self->_pairVerifyCompleted || self->_pairVerifyIdentityType == 2)
  {
    BOOL v26 = 1;
    goto LABEL_61;
  }
  uint64_t v99 = v25;
  int v30 = [v6 objectForKeyedSubscript:@"_dIRK"];

  if (v30
    || ([v6 objectForKeyedSubscript:@"_edPK"],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v31))
  {
    int v32 = self->_ucat->var0;
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:](self->_identityDaemon, "saveIdentityWithIDSDeviceID:message:error:", v99, v6, 0, v99);
    }
    else
    {
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:](self->_identityDaemon, "saveIdentityWithIDSDeviceID:message:error:", v99, v6, 0, v92);
    }
  }
  BOOL v26 = 1;
  if (!v14) {
    goto LABEL_86;
  }
LABEL_74:
  if (!v26) {
    goto LABEL_86;
  }
  if (self->_clientMode)
  {
    uint64_t v33 = [(RPCloudDaemon *)self->_cloudDaemon idsDeviceIDSelf];
    int v34 = [v33 isEqual:v99];

    if (v34)
    {
      int v35 = self->_ucat->var0;
      if (v35 <= 90 && (v35 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(CUBonjourDevice *)self->_bonjourPeerDevice reconfirm];
      BOOL v36 = 0;
      goto LABEL_195;
    }
  }
  -[RPEndpoint setIdsDeviceIdentifier:](self->_peerDeviceInfo, "setIdsDeviceIdentifier:", v99, v92);
LABEL_87:
  CFStringGetTypeID();
  uint64_t v37 = CFDictionaryGetTypedValue();

  if (v37 || v134 == -6756)
  {
    -[RPEndpoint setIdsCorrelationIdentifier:](self->_peerDeviceInfo, "setIdsCorrelationIdentifier:", v37, v92);
  }
  if (CFDictionaryGetInt64Ranged()) {
    -[RPCompanionLinkDevice setListeningPort:](self->_peerDeviceInfo, "setListeningPort:");
  }
  CFStringGetTypeID();
  unint64_t v38 = CFDictionaryGetTypedValue();
  if (v38 || v134 == -6756)
  {
    -[RPEndpoint setMediaRemoteIdentifier:](self->_peerDeviceInfo, "setMediaRemoteIdentifier:", v38, v92);
  }
  CFStringGetTypeID();
  uint64_t v39 = CFDictionaryGetTypedValue();
  if (v39 || v134 == -6756)
  {
    -[RPEndpoint setMediaRouteIdentifier:](self->_peerDeviceInfo, "setMediaRouteIdentifier:", v39, v92);
  }
  uint64_t v40 = NSDictionaryGetNSUUID();

  if (v40 || v134 == -6756)
  {
    -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_peerDeviceInfo, "setMediaSystemIdentifier:", v40, v92);
    id v21 = (void *)v40;
  }
  else
  {
    id v21 = 0;
  }
  CFStringGetTypeID();
  BOOL v15 = CFDictionaryGetTypedValue();
  if (v15 || v134 == -6756) {
    -[RPCompanionLinkDevice setMediaSystemName:](self->_peerDeviceInfo, "setMediaSystemName:", v15, v92);
  }
  else {
    BOOL v15 = 0;
  }
  uint64_t v41 = CFDictionaryGetInt64Ranged();
  if (!v134) {
    [(RPCompanionLinkDevice *)self->_peerDeviceInfo setMediaSystemRole:v41];
  }
  uint64_t v42 = CFDictionaryGetInt64Ranged();
  if (!v134) {
    [(RPCompanionLinkDevice *)self->_peerDeviceInfo setMediaSystemState:v42];
  }
LABEL_110:
  CFStringGetTypeID();
  uint64_t v43 = CFDictionaryGetTypedValue();

  if (v43) {
    [(RPEndpoint *)self->_peerDeviceInfo setModel:v43];
  }
  CFStringGetTypeID();
  uint64_t v44 = CFDictionaryGetTypedValue();

  if (v44) {
    [(RPEndpoint *)self->_peerDeviceInfo setName:v44];
  }
  CFStringGetTypeID();
  uint64_t v45 = CFDictionaryGetTypedValue();

  if (!v45) {
    goto LABEL_117;
  }
  peerDeviceInfo = self->_peerDeviceInfo;
  if (!peerDeviceInfo)
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v132 = 0;
    goto LABEL_122;
  }
  [(RPEndpoint *)peerDeviceInfo operatingSystemVersion];
  if (!v130)
  {
LABEL_122:
    RPStringToOperatingSystemVersion(v45, &v128);
    uint64_t v48 = self->_peerDeviceInfo;
    long long v126 = v128;
    uint64_t v127 = v129;
    uint64_t v49 = &v126;
    goto LABEL_128;
  }
LABEL_117:
  if (!v26) {
    goto LABEL_129;
  }
  uint64_t v47 = self->_peerDeviceInfo;
  if (v47)
  {
    [(RPEndpoint *)v47 operatingSystemVersion];
    if (v123) {
      goto LABEL_129;
    }
  }
  else
  {
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
  }
  cloudDaemon = self->_cloudDaemon;
  if (cloudDaemon)
  {
    [(RPCloudDaemon *)cloudDaemon operatingSystemVersionForID:v99];
  }
  else
  {
    long long v121 = 0uLL;
    uint64_t v122 = 0;
  }
  uint64_t v48 = self->_peerDeviceInfo;
  long long v119 = v121;
  uint64_t v120 = v122;
  uint64_t v49 = &v119;
LABEL_128:
  -[RPEndpoint setOperatingSystemVersion:](v48, "setOperatingSystemVersion:", v49, v92);
LABEL_129:
  uint64_t v51 = [(RPEndpoint *)self->_peerDeviceInfo model];
  if (v51)
  {
    uint64_t v52 = (void *)v51;
    uint64_t v53 = self->_peerDeviceInfo;
    if (v53)
    {
      [(RPEndpoint *)v53 operatingSystemVersion];

      if (v116 >= 1)
      {
        uint64_t v54 = [(RPEndpoint *)self->_peerDeviceInfo model];
        GestaltProductTypeStringToDeviceClass();

        int v55 = self->_peerDeviceInfo;
        if (v55)
        {
          [(RPEndpoint *)v55 operatingSystemVersion];
          uint64_t v56 = self->_peerDeviceInfo;
          if (v56)
          {
            [(RPEndpoint *)v56 operatingSystemVersion];
            uint64_t v57 = self->_peerDeviceInfo;
            if (v57)
            {
              [(RPEndpoint *)v57 operatingSystemVersion];
LABEL_140:
              LODWORD(v93) = 20200;
              self->_canDecode128bit = DeviceOSVersionAtOrLaterEx();
              goto LABEL_141;
            }
LABEL_139:
            uint64_t v107 = 0;
            uint64_t v108 = 0;
            uint64_t v109 = 0;
            goto LABEL_140;
          }
        }
        else
        {
          uint64_t v113 = 0;
          uint64_t v114 = 0;
          uint64_t v115 = 0;
        }
        uint64_t v110 = 0;
        uint64_t v111 = 0;
        uint64_t v112 = 0;
        goto LABEL_139;
      }
    }
    else
    {
      uint64_t v116 = 0;
      uint64_t v117 = 0;
      uint64_t v118 = 0;
    }
  }
LABEL_141:
  CFStringGetTypeID();
  uint64_t v58 = CFDictionaryGetTypedValue();

  if (v58) {
    [(RPCompanionLinkDevice *)self->_peerDeviceInfo setPublicIdentifier:v58];
  }
  if (v14)
  {
    CFStringGetTypeID();
    os_signpost_id_t v59 = CFDictionaryGetTypedValue();

    if (v59) {
      [(RPCompanionLinkDevice *)self->_peerDeviceInfo setRoomName:v59];
    }
    CFArrayGetTypeID();
    id v60 = CFDictionaryGetTypedValue();
    unint64_t v61 = v60;
    if (v60)
    {
      __int16 v97 = v21;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v62 = v60;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v103 objects:v135 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v104;
        id v96 = v7;
        while (2)
        {
          for (uint64_t i = 0; i != v64; ++i)
          {
            if (*(void *)v104 != v65) {
              objc_enumerationMutation(v62);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              id v7 = v96;
              goto LABEL_158;
            }
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v103 objects:v135 count:16];
          id v7 = v96;
          if (v64) {
            continue;
          }
          break;
        }
      }

      [(RPEndpoint *)self->_peerDeviceInfo setServiceTypes:v62];
LABEL_158:
      uint64_t v14 = v100;
      id v21 = v97;
    }

    CFDictionaryGetTypeID();
    uint64_t v67 = CFDictionaryGetTypedValue();
    if (v67) {
      [(RPCompanionLinkDevice *)self->_peerDeviceInfo setSiriInfo:v67];
    }
  }
  else
  {
    os_signpost_id_t v59 = v58;
  }
  CFStringGetTypeID();
  BOOL v15 = CFDictionaryGetTypedValue();

  if (v15) {
    [(RPEndpoint *)self->_peerDeviceInfo setSourceVersion:v15];
  }
  if (v14)
  {
    unint64_t v68 = CFDictionaryGetInt64();
    if (!v134)
    {
      unint64_t v69 = v68;
      id v70 = v21;
      id v71 = v7;
      if ((*(void *)&v98 & 0x80000) != 0) {
        uint64_t v72 = (v68 >> 33) & 0x80;
      }
      else {
        uint64_t v72 = 0;
      }
      unint64_t v73 = [(RPEndpoint *)self->_peerDeviceInfo statusFlags];
      uint64_t v74 = v72 | v69 & 0x10000010180;
      id v7 = v71;
      id v21 = v70;
      [(RPEndpoint *)self->_peerDeviceInfo setStatusFlags:v74 | v73 & 0xFFFFFEFFFFFEFE7FLL];
    }
    CFStringGetTypeID();
    BOOL v75 = CFDictionaryGetTypedValue();
    if (v75) {
      [(RPCompanionLinkDevice *)self->_peerDeviceInfo setActiveUserAltDSID:v75];
    }
    char v76 = CFDictionaryGetInt64Ranged();
    if (!v134) {
      [(RPCompanionLinkDevice *)self->_peerDeviceInfo setDeviceCapabilityFlags:[(RPCompanionLinkDevice *)self->_peerDeviceInfo deviceCapabilityFlags] & 0xFFFFFFFE | v76 & 1];
    }
  }
  if (([(RPEndpoint *)self->_peerDeviceInfo statusFlags] & 0x2000000000) != 0)
  {
    uint64_t v77 = objc_alloc_init(RPIdentity);
    long long v78 = [(RPEndpoint *)self->_peerDeviceInfo verifiedIdentity];
    [(RPIdentity *)v77 setIdentifier:v78];

    uint64_t v79 = [(RPEndpoint *)self->_peerDeviceInfo model];
    [(RPIdentity *)v77 setModel:v79];

    id v80 = [(RPEndpoint *)self->_peerDeviceInfo name];
    [(RPIdentity *)v77 setName:v80];

    [(RPIdentityDaemon *)self->_identityDaemon updateSessionPairedIdentity:v77];
    uint64_t v81 = [(RPEndpoint *)self->_peerDeviceInfo verifiedIdentity];
    [(RPEndpoint *)self->_peerDeviceInfo setIdsDeviceIdentifier:v81];

    uint64_t v82 = [(RPEndpoint *)self->_peerDeviceInfo verifiedIdentity];
    [(RPEndpoint *)self->_peerDeviceInfo setIdentifier:v82];
  }
  if (v7)
  {
    if (self->_internalState == 27)
    {
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __40__RPConnection__receivedSystemInfo_xid___block_invoke;
      v101[3] = &unk_1E605B568;
      v101[4] = self;
      id v102 = v7;
      uint64_t v83 = (void (**)(void, void))MEMORY[0x1B3EBCC80](v101);
      id sessionStartHandler = (void (**)(id, void))self->_sessionStartHandler;
      if (sessionStartHandler)
      {
        sessionStartHandler[2](sessionStartHandler, v83);
        id v85 = self->_sessionStartHandler;
        self->_id sessionStartHandler = 0;
      }
      else
      {
        v83[2](v83, 0);
      }
    }
    else
    {
      uint64_t v87 = [(RPConnection *)self _systeminfo];
      LOBYTE(v94) = 0;
      [(RPConnection *)self _sendEncryptedResponse:v87 options:0 error:0 xid:v7 requestID:@"_systemInfo" highPriority:0 isChatty:v94 replyStartTime:0];
    }
  }
  else if (self->_state == 1)
  {
    id peerUpdatedHandler = (void (**)(void))self->_peerUpdatedHandler;
    if (peerUpdatedHandler) {
      peerUpdatedHandler[2]();
    }
  }
  uint64_t v88 = [(RPConnection *)self proxyDeviceUpdateHandler];
  __int16 v89 = (void *)v88;
  if (v14 && v88) {
    (*(void (**)(uint64_t))(v88 + 16))(v88);
  }
  int v90 = self->_ucat->var0;
  if (v90 <= 10 && (v90 != -1 || _LogCategory_Initialize()))
  {
    __int16 v95 = [(RPConnection *)self descriptionWithLevel:10];
    LogPrintF();
  }
  BOOL v36 = 1;
LABEL_195:

  return v36;
}

void __40__RPConnection__receivedSystemInfo_xid___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) _systeminfo];
  }
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[37];
  if (v5 <= 10)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), int v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
    }
  }
  LOBYTE(v7) = 0;
  [v4 _sendEncryptedResponse:v3 options:0 error:v8 xid:*(void *)(a1 + 40) requestID:@"_systemInfo" highPriority:0 isChatty:v7 replyStartTime:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 140) = 1;
  [*(id *)(a1 + 32) _run];
}

- (id)_systeminfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t statusFlags = self->_statusFlags;
  uint64_t v5 = statusFlags & 0x10000AE000;
  uint64_t v6 = [(RPEndpoint *)self->_localDeviceInfo accountAltDSID];
  id v7 = (void *)v6;
  if ((statusFlags & 0x10000AE000) != 0 && v6 != 0) {
    [v3 setObject:v6 forKeyedSubscript:@"_accAltDSID"];
  }
  id v9 = [(RPEndpoint *)self->_localDeviceInfo accountID];

  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    [v3 setObject:v9 forKeyedSubscript:@"_accID"];
  }
  id v11 = self->_appID;

  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"_appID"];
  }
  id v12 = self->_appInfoSelf;

  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"_appInfo"];
  }
  unint64_t v63 = 0;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags(&v63, [(RPCompanionLinkDevice *)self->_localDeviceInfo flags]);
  int8x16_t v13 = [NSNumber numberWithUnsignedLongLong:v63];
  [v3 setObject:v13 forKeyedSubscript:@"_bf"];

  if (v5 || (self->_statusFlags & 0x2000000000) != 0)
  {
    p_isa = self->_serviceType;

    if (p_isa) {
      [v3 setObject:p_isa forKeyedSubscript:@"_clSrv"];
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      serviceType = self->_serviceType;
      LogPrintF();
    }
    if (v5)
    {
      __int16 v17 = [(RPCompanionLinkDevice *)self->_localDeviceInfo flags];
      uint64_t v14 = v17 & 0x280;
      if ((v17 & 0x280) != 0)
      {
        __int16 v18 = [NSNumber numberWithUnsignedInt:v14];
        [v3 setObject:v18 forKeyedSubscript:@"_clFl"];
      }
    }
  }
  else
  {
    p_isa = (NSString *)&v12->super.isa;
  }
  if ((self->_controlFlags & 0x200) != 0)
  {
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:self->_controlFlags & 0x200];
    [v3 setObject:v19 forKeyedSubscript:@"_cf"];
  }
  if (v5)
  {
    uint64_t v20 = [(RPCompanionLinkDevice *)self->_localDeviceInfo deviceColor];

    if (!v20)
    {
      p_isa = 0;
      if ((statusFlags & 0x80000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_33;
    }
    [v3 setObject:v20 forKeyedSubscript:@"_dC"];
    p_isa = (NSString *)v20;
  }
  if ((statusFlags & 0x80000) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  uint64_t v21 = [(RPCompanionLinkDevice *)self->_localDeviceInfo role];

  if (v21)
  {
    [v3 setObject:v21 forKeyedSubscript:@"_forcedRole"];
    p_isa = (NSString *)v21;
  }
  else
  {
    p_isa = 0;
  }
LABEL_38:
  if (v5)
  {
    uint64_t v22 = [(RPCompanionLinkDevice *)self->_localDeviceInfo homeKitIdentifier];

    if (v22) {
      [v3 setObject:v22 forKeyedSubscript:@"_hkID"];
    }
    id v23 = [(RPEndpoint *)self->_localDeviceInfo homeKitUserIdentifiers];

    if (v23)
    {
      uint64_t v24 = [(RPEndpoint *)self->_localDeviceInfo homeKitUserIdentifiers];
      [v3 setObject:v24 forKeyedSubscript:@"_hkUID"];
    }
    if (self->_btPipe)
    {
      int DeviceClass = GestaltGetDeviceClass();
      BOOL v26 = @"BTPipe-Phone";
      if (DeviceClass == 6) {
        BOOL v26 = @"BTPipe-Watch";
      }
      p_isa = v26;

      goto LABEL_48;
    }
    p_isa = [(RPEndpoint *)self->_localDeviceInfo identifier];

    if (p_isa) {
LABEL_48:
    }
      [v3 setObject:p_isa forKeyedSubscript:@"_i"];
  }
  if ((statusFlags & 0x80000) != 0 && self->_pairVerifyCompleted && self->_pairVerifyIdentityType != 2)
  {
    int v29 = self->_ucat->var0;
    if (v29 > 30 || v29 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_63;
    }
LABEL_59:
    LogPrintF();
LABEL_63:
    -[RPIdentityDaemon addSelfIdentityInfoToMessage:flags:](self->_identityDaemon, "addSelfIdentityInfoToMessage:flags:", v3, 0, serviceType);
    goto LABEL_64;
  }
  if ((self->_statusFlags & 0x2000) != 0)
  {
    int v27 = GestaltGetDeviceClass();
    if (!RPDeviceIsCommunal(v27))
    {
      int v28 = self->_ucat->var0;
      if (v28 > 30 || v28 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_63;
      }
      goto LABEL_59;
    }
  }
LABEL_64:
  if (v5)
  {
    int v30 = [(RPEndpoint *)self->_localDeviceInfo idsDeviceIdentifier];

    if (v30) {
      [v3 setObject:v30 forKeyedSubscript:@"_idsID"];
    }
    uint64_t v31 = [(RPEndpoint *)self->_localDeviceInfo idsCorrelationIdentifier];

    if (v31) {
      [v3 setObject:v31 forKeyedSubscript:@"_idsCID"];
    }
    uint64_t v32 = [(RPCompanionLinkDevice *)self->_localDeviceInfo listeningPort];
    if (v32)
    {
      uint64_t v33 = [NSNumber numberWithInt:v32];
      [v3 setObject:v33 forKeyedSubscript:@"_lP"];
    }
    int v34 = [(RPEndpoint *)self->_localDeviceInfo mediaRemoteIdentifier];

    if (v34) {
      [v3 setObject:v34 forKeyedSubscript:@"_mrID"];
    }
    int v35 = [(RPEndpoint *)self->_localDeviceInfo mediaRouteIdentifier];

    if (v35) {
      [v3 setObject:v35 forKeyedSubscript:@"_mRtID"];
    }
    BOOL v36 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemIdentifier];

    if (v36) {
      [v3 setObject:v36 forKeyedSubscript:@"_msId"];
    }
    uint64_t v37 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemName];

    if (v37) {
      [v3 setObject:v37 forKeyedSubscript:@"_msNm"];
    }
    uint64_t v38 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemRole];
    if (v38)
    {
      uint64_t v39 = [NSNumber numberWithInt:v38];
      [v3 setObject:v39 forKeyedSubscript:@"_msRo"];
    }
    uint64_t v40 = [(RPCompanionLinkDevice *)self->_localDeviceInfo mediaSystemState];
    if (v40)
    {
      uint64_t v41 = [NSNumber numberWithInt:v40];
      [v3 setObject:v41 forKeyedSubscript:@"_msSt"];
    }
    p_isa = [(RPCompanionLinkDevice *)self->_localDeviceInfo activeUserAltDSID];

    if (p_isa) {
      [v3 setObject:p_isa forKeyedSubscript:@"_aaltDSID"];
    }
    uint64_t v42 = [(RPCompanionLinkDevice *)self->_localDeviceInfo deviceCapabilityFlags];
    if (v42)
    {
      uint64_t v43 = [NSNumber numberWithUnsignedInt:v42];
      [v3 setObject:v43 forKeyedSubscript:@"_dCapF"];
    }
  }
  uint64_t v44 = objc_msgSend(v3, "objectForKeyedSubscript:", @"model", serviceType);

  if (!v44)
  {
    uint64_t v45 = [(RPEndpoint *)self->_localDeviceInfo model];

    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"model"];
      p_isa = (NSString *)v45;
    }
    else
    {
      p_isa = 0;
    }
  }
  uint64_t v46 = [v3 objectForKeyedSubscript:@"name"];

  if (!v46)
  {
    uint64_t v47 = GestaltCopyAnswer();

    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"name"];
      p_isa = (NSString *)v47;
    }
    else
    {
      p_isa = 0;
    }
  }
  localDeviceInfo = self->_localDeviceInfo;
  if (v5)
  {
    if (localDeviceInfo)
    {
      [(RPEndpoint *)localDeviceInfo operatingSystemVersion];
      localDeviceInfo = self->_localDeviceInfo;
      if (v60 >= 1)
      {
        if (localDeviceInfo) {
          [(RPEndpoint *)localDeviceInfo operatingSystemVersion];
        }
        else {
          memset(v59, 0, sizeof(v59));
        }
        uint64_t v49 = RPNSOperatingSystemVersionToString(v59);
        if (v49) {
          [v3 setObject:v49 forKeyedSubscript:@"_osV"];
        }

        localDeviceInfo = self->_localDeviceInfo;
      }
    }
    else
    {
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
    }
  }
  uint64_t v50 = [(RPCompanionLinkDevice *)localDeviceInfo publicIdentifier];

  if (v50) {
    [v3 setObject:v50 forKeyedSubscript:@"_pubID"];
  }
  if (v5)
  {
    uint64_t v51 = [(RPCompanionLinkDevice *)self->_localDeviceInfo roomName];

    if (v51) {
      [v3 setObject:v51 forKeyedSubscript:@"_roomName"];
    }
    uint64_t v52 = [(RPEndpoint *)self->_localDeviceInfo serviceTypes];

    if (v52) {
      [v3 setObject:v52 forKeyedSubscript:@"_stA"];
    }
    uint64_t v50 = [(RPCompanionLinkDevice *)self->_localDeviceInfo siriInfo];

    if (v50) {
      [v3 setObject:v50 forKeyedSubscript:@"_siriInfo"];
    }
  }
  [v3 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  if (self->_pairVerifyIdentityType == 2)
  {
    uint64_t v53 = objc_msgSend(NSNumber, "numberWithInt:", -[RPEndpoint activityLevel](self->_localDeviceInfo, "activityLevel"));
    [v3 setObject:v53 forKeyedSubscript:@"_actLvl"];
  }
  if (v5)
  {
    unint64_t v54 = [(RPEndpoint *)self->_localDeviceInfo statusFlags] & 0x10000010100;
    if (v54)
    {
      int v55 = [NSNumber numberWithUnsignedLongLong:v54];
      [v3 setObject:v55 forKeyedSubscript:@"_sf"];
    }
  }
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0) {
    [(RPConnection *)self _identityProofsAdd:v3 update:0];
  }
  id v56 = v3;

  return v56;
}

- (id)_allowedMACAddressesForMCFeature:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [(Class)getMCProfileConnectionClass[0]() sharedConnection];
  uint64_t v5 = [v4 effectiveValuesForUnionSetting:v3];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v12 UTF8String]
            && !TextToHardwareAddress())
          {
            int8x16_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v15 length:6];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_configureForSessionPairing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_identityDaemon;
  if (v5)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__RPConnection__configureForSessionPairing___block_invoke;
    v9[3] = &unk_1E605C518;
    v9[4] = v5;
    v9[5] = self;
    [v4 setCopyIdentityHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __44__RPConnection__configureForSessionPairing___block_invoke_2;
    v8[3] = &unk_1E605C540;
    v8[4] = self;
    v8[5] = v5;
    [v4 setFindPeerHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__RPConnection__configureForSessionPairing___block_invoke_3;
    v7[3] = &unk_1E605C568;
    v7[4] = self;
    void v7[5] = v5;
    [v4 setSavePeerHandler:v7];
  }
}

id __44__RPConnection__configureForSessionPairing___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = *(void **)(a1 + 32);
  id v17 = 0;
  id v7 = [v6 identityOfSelfAndReturnError:&v17];
  id v8 = v17;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 296);
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F5E188]);
    id v12 = [*(id *)(a1 + 32) sessionPairingIdentifier];
    [v11 setIdentifier:v12];

    int8x16_t v13 = [v7 deviceIRKData];
    [v11 setAltIRK:v13];

    uint64_t v14 = [v7 edPKData];
    [v11 setPublicKey:v14];

    if ((a2 & 2) != 0)
    {
      BOOL v15 = [v7 edSKData];
      [v11 setSecretKey:v15];
    }
  }

  return v11;
}

uint64_t __44__RPConnection__configureForSessionPairing___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  int v8 = **(_DWORD **)(*(void *)(a1 + 32) + 296);
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    id v26 = v7;
    uint64_t v27 = a3;
    LogPrintF();
  }
  BOOL v9 = *(void **)(a1 + 40);
  id v34 = 0;
  int v10 = objc_msgSend(v9, "identitiesOfType:error:", 13, &v34, v26, v27);
  id v11 = v34;
  id v12 = v11;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    int8x16_t v13 = [v7 identifier];
    uint64_t v14 = [v13 UUIDString];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = v10;
    id v16 = (id)[v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      int v28 = v10;
      id v29 = v7;
      uint64_t v17 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          long long v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v20 = [v19 identifier];
          int v21 = [v20 isEqual:v14];

          if (v21)
          {
            id v16 = v19;
            goto LABEL_18;
          }
        }
        id v16 = (id)[v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_18:
      int v10 = v28;
      id v7 = v29;
    }

    if (!a4 || v16)
    {
      uint64_t v22 = [v16 name];
      [0 setName:v22];

      id v23 = [v16 model];
      [0 setModel:v23];

      uint64_t v24 = [v16 edPKData];
      [0 setPublicKey:v24];
    }
    else
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return 0;
}

BOOL __44__RPConnection__configureForSessionPairing___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 296);
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = [[RPIdentity alloc] initWithPairedPeer:v3 type:13];
  if (v5)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setStatusFlags:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "statusFlags") | 0x2000000000);
    id v6 = [(RPIdentity *)v5 identifier];
    [*(id *)(*(void *)(a1 + 32) + 672) setVerifiedIdentity:v6];

    [*(id *)(a1 + 40) addSessionPairedIdentity:v5];
  }

  return v5 != 0;
}

- (void)addInUseProcess:(int)a3
{
  uint64_t v4 = RPProcessIDToNameString(*(uint64_t *)&a3);
  inUseProcesses = self->_inUseProcesses;
  id v8 = (id)v4;
  if (!inUseProcesses)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_inUseProcesses;
    self->_inUseProcesses = v6;

    uint64_t v4 = (uint64_t)v8;
    inUseProcesses = self->_inUseProcesses;
  }
  [(NSMutableSet *)inUseProcesses addObject:v4];
}

- (BOOL)containsInUseProcess:(int)a3
{
  if (!self->_inUseProcesses) {
    return 0;
  }
  id v3 = self;
  uint64_t v4 = RPProcessIDToNameString(*(uint64_t *)&a3);
  LOBYTE(v3) = [(NSMutableSet *)v3->_inUseProcesses containsObject:v4];

  return (char)v3;
}

- (id)inUseProcessesToString
{
  inUseProcesses = self->_inUseProcesses;
  if (inUseProcesses)
  {
    id v3 = [(NSMutableSet *)inUseProcesses allObjects];
    uint64_t v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)removeInUseProcess:(int)a3
{
  if (self->_inUseProcesses)
  {
    RPProcessIDToNameString(*(uint64_t *)&a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)self->_inUseProcesses removeObject:v4];
  }
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_int passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSDictionary)appInfoPeer
{
  return self->_appInfoPeer;
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (void)setAppInfoSelf:(id)a3
{
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_bleClientUseCase = a3;
}

- (CUBLEConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setBleConnection:(id)a3
{
}

- (NSUUID)blePeerIdentifier
{
  return self->_blePeerIdentifier;
}

- (void)setBlePeerIdentifier:(id)a3
{
}

- (unsigned)bleConnectionPSM
{
  return self->_bleConnectionPSM;
}

- (void)setBleConnectionPSM:(unsigned __int16)a3
{
  self->_uint64_t bleConnectionPSM = a3;
}

- (CUBonjourDevice)bonjourPeerDevice
{
  return self->_bonjourPeerDevice;
}

- (void)setBonjourPeerDevice:(id)a3
{
}

- (CUBluetoothScalablePipe)btPipe
{
  return self->_btPipe;
}

- (void)setBtPipe:(id)a3
{
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(BOOL)a3
{
  self->_BOOL clientMode = a3;
}

- (RPCloudDaemon)cloudDaemon
{
  return self->_cloudDaemon;
}

- (void)setCloudDaemon:(id)a3
{
}

- (id)configurePairingHandler
{
  return self->_configurePairingHandler;
}

- (void)setConfigurePairingHandler:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_id flags = a3;
}

- (BOOL)flowControlReadEnabled
{
  return self->_flowControlReadEnabled;
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
}

- (RPIdentity)forcedPeerIdentity
{
  return self->_forcedPeerIdentity;
}

- (void)setForcedPeerIdentity:(id)a3
{
}

- (RPIdentity)forcedSelfIdentity
{
  return self->_forcedSelfIdentity;
}

- (void)setForcedSelfIdentity:(id)a3
{
}

- (CUHomeKitManager)homeKitManager
{
  return self->_homeKitManager;
}

- (void)setHomeKitManager:(id)a3
{
}

- (id)homeKitUserIdentifierHandler
{
  return self->_homeKitUserIdentifierHandler;
}

- (void)setHomeKitUserIdentifierHandler:(id)a3
{
}

- (NSString)identifierOverride
{
  return self->_identifierOverride;
}

- (void)setIdentifierOverride:(id)a3
{
}

- (RPIdentityDaemon)identityDaemon
{
  return self->_identityDaemon;
}

- (void)setIdentityDaemon:(id)a3
{
}

- (RPIdentity)identityResolved
{
  return self->_identityResolved;
}

- (void)setIdentityResolved:(id)a3
{
}

- (RPIdentity)identityVerified
{
  return self->_identityVerified;
}

- (BOOL)invalidationHandled
{
  return self->_invalidationHandled;
}

- (void)setInvalidationHandled:(BOOL)a3
{
  self->_invalidationHandled = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_unsigned int keepAliveSeconds = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int)linkType
{
  return self->_linkType;
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (void)setLocalDeviceInfo:(id)a3
{
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
}

- (int)pairVerifyAuthType
{
  return self->_pairVerifyAuthType;
}

- (id)pairVerifyCompletion
{
  return self->_pairVerifyCompletion;
}

- (void)setPairVerifyCompletion:(id)a3
{
}

- (NSString)peerAddrString
{
  return self->_peerAddrString;
}

- (RPCompanionLinkDevice)peerDeviceInfo
{
  return self->_peerDeviceInfo;
}

- (NSString)peerHomeKitUserIdentifier
{
  return self->_peerHomeKitUserIdentifier;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (id)peerUpdatedHandler
{
  return self->_peerUpdatedHandler;
}

- (void)setPeerUpdatedHandler:(id)a3
{
}

- (BOOL)preAuthEnabled
{
  return self->_preAuthEnabled;
}

- (void)setPreAuthEnabled:(BOOL)a3
{
  self->_preAuthEnabled = a3;
}

- (int)preferredIdentityType
{
  return self->_preferredIdentityType;
}

- (void)setPreferredIdentityType:(int)a3
{
  self->_int preferredIdentityType = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (id)proxyDeviceUpdateHandler
{
  return self->_proxyDeviceUpdateHandler;
}

- (void)setProxyDeviceUpdateHandler:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
}

- (id)readErrorHandler
{
  return self->_readErrorHandler;
}

- (void)setReadErrorHandler:(id)a3
{
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (NSMutableArray)receivedMessages
{
  return self->_receivedMessages;
}

- (void)setReceivedMessages:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (CUTCPConnection)tcpConnection
{
  return self->_tcpConnection;
}

- (void)setTcpConnection:(id)a3
{
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSMutableArray)proxyDevices
{
  return self->_proxyDevices;
}

- (void)setProxyDevices:(id)a3
{
}

- (CUBluetoothScalablePipe)btPipeHighPriority
{
  return self->_btPipeHighPriority;
}

- (void)setBtPipeHighPriority:(id)a3
{
}

- (NSMutableSet)inUseProcesses
{
  return self->_inUseProcesses;
}

- (void)setInUseProcesses:(id)a3
{
}

- (BOOL)canDecode128bit
{
  return self->_canDecode128bit;
}

- (void)setCanDecode128bit:(BOOL)a3
{
  self->_canDecode128bit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseProcesses, 0);
  objc_storeStrong((id *)&self->_btPipeHighPriority, 0);
  objc_storeStrong((id *)&self->_proxyDevices, 0);
  objc_storeStrong((id *)&self->_tcpConnection, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_receivedMessages, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong(&self->_readErrorHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong(&self->_proxyDeviceUpdateHandler, 0);
  objc_storeStrong(&self->_peerUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDeviceInfo, 0);
  objc_storeStrong(&self->_pairVerifyCompletion, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identityVerified, 0);
  objc_storeStrong((id *)&self->_identityResolved, 0);
  objc_storeStrong((id *)&self->_identityDaemon, 0);
  objc_storeStrong((id *)&self->_identifierOverride, 0);
  objc_storeStrong(&self->_homeKitUserIdentifierHandler, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
  objc_storeStrong((id *)&self->_forcedSelfIdentity, 0);
  objc_storeStrong((id *)&self->_forcedPeerIdentity, 0);
  objc_storeStrong(&self->_flowControlWriteChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong(&self->_configurePairingHandler, 0);
  objc_storeStrong((id *)&self->_cloudDaemon, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_bonjourPeerDevice, 0);
  objc_storeStrong((id *)&self->_blePeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bleConnection, 0);
  objc_storeStrong((id *)&self->_appInfoSelf, 0);
  objc_storeStrong((id *)&self->_appInfoPeer, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_sendArray, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestable, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong((id *)&self->_mainStream, 0);
  objc_storeStrong((id *)&self->_homeKitIdentitySignature, 0);
  objc_storeStrong((id *)&self->_homeKitIdentityIdentifier, 0);
  objc_storeStrong((id *)&self->_highPriorityStream, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_probeTimer, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_selfAddrString, 0);
  objc_storeStrong((id *)&self->_peerHomeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_peerAddrString, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_identitySignature, 0);
  objc_storeStrong((id *)&self->_identityKeyData, 0);
  objc_storeStrong((id *)&self->_bleConnectTimer, 0);
}

@end