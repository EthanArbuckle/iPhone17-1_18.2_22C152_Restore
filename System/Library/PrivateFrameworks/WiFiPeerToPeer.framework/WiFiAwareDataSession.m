@interface WiFiAwareDataSession
- (BOOL)pairingCachingEnabled;
- (NSData)pmk;
- (NSData)pmkID;
- (NSString)description;
- (NSString)passphrase;
- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5;
- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6;
- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6 pmk:(id)a7 pmkID:(id)a8;
- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6;
- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6 pmkID:(id)a7;
- (WiFiAwareDataSessionDelegate)delegate;
- (WiFiAwareDataSessionPairingDelegate)pairingDelegate;
- (WiFiAwareDiscoveryResult)discoveryResult;
- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration;
- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo;
- (WiFiAwarePublishServiceSpecificInfo)pairSetupServiceSpecificInfo;
- (WiFiMACAddress)localDataAddress;
- (id)exportedInterface;
- (id)remoteObjectInterface;
- (int64_t)internetSharingPolicy;
- (int64_t)pairingMethod;
- (int64_t)serviceType;
- (unsigned)localInterfaceIndex;
- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4;
- (void)datapathFailedToStartWithError:(int64_t)a3;
- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4;
- (void)datapathReceivedControlDataAddress:(id)a3 serviceSpecificInfo:(id)a4 onInterfaceIndex:(unsigned int)a5;
- (void)datapathStartedWithInstanceID:(unsigned __int8)a3 initiatorDataAddress:(id)a4 localInterfaceIndex:(unsigned int)a5;
- (void)datapathTerminatedWithReason:(int64_t)a3;
- (void)datapathUpdatedInternetSharingPolicy:(int64_t)a3;
- (void)datapathUpdatedPeerRSSI:(int)a3;
- (void)generateCurrentNetworkRecordForInternetSharingSession:(id)a3;
- (void)generateStatisticsReportWithCompletionHandler:(id)a3;
- (void)handleError:(int64_t)a3;
- (void)reportIssue:(id)a3;
- (void)resetState;
- (void)setDelegate:(id)a3;
- (void)setInternetSharingConfiguration:(id)a3;
- (void)setPairSetupServiceSpecificInfo:(id)a3;
- (void)setPairingCachingEnabled:(BOOL)a3;
- (void)setPairingDelegate:(id)a3;
- (void)setPairingMethod:(int64_t)a3;
- (void)setWantsPeerRSSIUpdates:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)start;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
- (void)stop;
- (void)updateLinkStatus:(int64_t)a3;
@end

@implementation WiFiAwareDataSession

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6 pmk:(id)a7 pmkID:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)WiFiAwareDataSession;
  v20 = [(WiFiAwareDataSession *)&v40 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_discoveryResult, a3);
    v21->_serviceType = a4;
    uint64_t v22 = [v16 copy];
    serviceSpecificInfo = v21->_serviceSpecificInfo;
    v21->_serviceSpecificInfo = (WiFiAwarePublishDatapathServiceSpecificInfo *)v22;

    uint64_t v24 = [v17 copy];
    passphrase = v21->_passphrase;
    v21->_passphrase = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    pmk = v21->_pmk;
    v21->_pmk = (NSData *)v26;

    uint64_t v28 = [v19 copy];
    pmkID = v21->_pmkID;
    v21->_pmkID = (NSData *)v28;

    v30 = [v15 pairingConfiguration];
    v31 = [v30 supportedPairSetupMethods];
    v32 = [v31 firstObject];
    v21->_pairingMethod = [v32 integerValue];

    v33 = [v15 pairingConfiguration];
    v21->_pairingCachingEnabled = [v33 pairingCachingEnabled];

    v34 = [WiFiP2PXPCConnection alloc];
    v35 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v36 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwareDataSession", 0, v35);
    uint64_t v37 = [(WiFiP2PXPCConnection *)v34 initWithEndpointType:1 queue:v36 retryTimeout:5000000000];
    xpcConnection = v21->_xpcConnection;
    v21->_xpcConnection = (WiFiP2PXPCConnection *)v37;

    [(WiFiP2PXPCConnection *)v21->_xpcConnection setDelegate:v21];
    v21->_internetSharingPolicy = 0;
  }

  return v21;
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5
{
  return [(WiFiAwareDataSession *)self initWithDiscoveryResult:a3 serviceType:a4 serviceSpecificInfo:a5 passphrase:0 pmk:0 pmkID:0];
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6
{
  return [(WiFiAwareDataSession *)self initWithDiscoveryResult:a3 serviceType:a4 serviceSpecificInfo:a5 passphrase:a6 pmk:0 pmkID:0];
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6
{
  return [(WiFiAwareDataSession *)self initWithDiscoveryResult:a3 serviceType:a4 serviceSpecificInfo:a5 passphrase:0 pmk:a6 pmkID:0];
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6 pmkID:(id)a7
{
  return [(WiFiAwareDataSession *)self initWithDiscoveryResult:a3 serviceType:a4 serviceSpecificInfo:a5 passphrase:0 pmk:a6 pmkID:a7];
}

- (void)handleError:(int64_t)a3
{
  v5 = [(WiFiAwareDataSession *)self delegate];
  id v6 = v5;
  if (self->_datapathID) {
    [v5 dataSession:self terminatedWithReason:-1];
  }
  else {
    [v5 dataSession:self failedToStartWithError:a3];
  }
  [(WiFiAwareDataSession *)self resetState];
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815418];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18115B0];
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  self->_internetSharingPolicy = 0;
  id v18 = a4;
  id v17 = a3;
  id v19 = [WiFiAwareDatapathConfiguration alloc];
  id v6 = [(WiFiAwareDataSession *)self discoveryResult];
  int64_t v7 = [(WiFiAwareDataSession *)self serviceType];
  v8 = [(WiFiAwareDataSession *)self passphrase];
  v9 = [(WiFiAwareDataSession *)self pmk];
  v10 = [(WiFiAwareDataSession *)self pmkID];
  v11 = [(WiFiAwareDataSession *)self serviceSpecificInfo];
  v12 = [(WiFiAwareDataSession *)self internetSharingConfiguration];
  int64_t v13 = [(WiFiAwareDataSession *)self pairingMethod];
  BOOL v14 = [(WiFiAwareDataSession *)self pairingCachingEnabled];
  id v15 = [(WiFiAwareDataSession *)self pairSetupServiceSpecificInfo];
  LOBYTE(v16) = v14;
  v20 = [(WiFiAwareDatapathConfiguration *)v19 initWithDiscoveryResult:v6 serviceType:v7 passphrase:v8 pmk:v9 pmkID:v10 serviceSpecificInfo:v11 internetSharingConfiguration:v12 pairingMethod:v13 pairingCachingEnabled:v16 pairSetupServiceSpecificInfo:v15];

  [v17 createDatapathWithConfiguration:v20 completionHandler:v18];
}

- (void)resetState
{
  datapathID = self->_datapathID;
  self->_datapathID = 0;

  initiatorDataAddress = self->_initiatorDataAddress;
  self->_initiatorDataAddress = 0;

  self->_localInterfaceIndex = 0;
}

- (void)start
{
}

- (void)stop
{
}

uint64_t __28__WiFiAwareDataSession_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)reportIssue:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__WiFiAwareDataSession_reportIssue___block_invoke;
  v7[3] = &unk_1E633EB50;
  id v8 = v4;
  id v6 = v4;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v7];
}

uint64_t __36__WiFiAwareDataSession_reportIssue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reportIssue:*(void *)(a1 + 32)];
}

- (void)updateLinkStatus:(int64_t)a3
{
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__WiFiAwareDataSession_updateLinkStatus___block_invoke;
  v4[3] = &__block_descriptor_40_e32_v16__0___WiFiAwareDatapathXPC__8l;
  v4[4] = a3;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v4];
}

uint64_t __41__WiFiAwareDataSession_updateLinkStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateLinkStatus:*(void *)(a1 + 32)];
}

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpcConnection = self->_xpcConnection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E633EBC0;
    id v10 = v4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3;
    v7[3] = &unk_1E633EBE8;
    id v8 = v10;
    [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v9 clientCompletionHandler:v7];
  }
}

void __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E633EB98;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a2 generateStatisticsReportWithCompletionHandler:v7];
}

void __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)generateCurrentNetworkRecordForInternetSharingSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    xpcConnection = self->_xpcConnection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke;
    v9[3] = &unk_1E633EBC0;
    id v10 = v4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_3;
    v7[3] = &unk_1E633EBE8;
    id v8 = v10;
    [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v9 clientCompletionHandler:v7];
  }
}

void __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_2;
  v7[3] = &unk_1E633EC10;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a2 generateCurrentNetworkRecordForInternetSharingSession:v7];
}

void __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)setWantsPeerRSSIUpdates:(BOOL)a3 withCompletionHandler:(id)a4
{
  xpcConnection = self->_xpcConnection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__WiFiAwareDataSession_setWantsPeerRSSIUpdates_withCompletionHandler___block_invoke;
  v5[3] = &__block_descriptor_33_e42_v24__0___WiFiAwareDatapathXPC__8___v__q_16l;
  BOOL v6 = a3;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v5 clientCompletionHandler:a4];
}

uint64_t __70__WiFiAwareDataSession_setWantsPeerRSSIUpdates_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setWantsPeerRSSIUpdates:*(unsigned __int8 *)(a1 + 32) withCompletionHandler:a3];
}

- (WiFiMACAddress)localDataAddress
{
  return self->_initiatorDataAddress;
}

- (NSString)description
{
  datapathID = self->_datapathID;
  if (datapathID)
  {
    id v4 = [NSString stringWithFormat:@"%@", datapathID];
  }
  else
  {
    id v4 = @"unset";
  }
  if (self->_initiatorDataAddress)
  {
    id v5 = [NSString stringWithFormat:@"%@", self->_initiatorDataAddress];
  }
  else
  {
    id v5 = @"unset";
  }
  BOOL v6 = NSString;
  uint64_t localInterfaceIndex = self->_localInterfaceIndex;
  id v8 = [(WiFiAwareDataSession *)self discoveryResult];
  id v9 = [v6 stringWithFormat:@"<WiFiAwareDataSession: datapathID=%@, initiator=%@, localIdx=%u, discoveryResult=%@>", v4, v5, localInterfaceIndex, v8];

  return (NSString *)v9;
}

- (void)datapathStartedWithInstanceID:(unsigned __int8)a3 initiatorDataAddress:(id)a4 localInterfaceIndex:(unsigned int)a5
{
  uint64_t v6 = a3;
  id v8 = (WiFiMACAddress *)a4;
  datapathID = self->_datapathID;
  id v10 = [NSNumber numberWithUnsignedChar:v6];
  v11 = self->_datapathID;
  self->_datapathID = v10;

  initiatorDataAddress = self->_initiatorDataAddress;
  self->_initiatorDataAddress = v8;

  self->_uint64_t localInterfaceIndex = a5;
  if (!datapathID)
  {
    id v13 = [(WiFiAwareDataSession *)self delegate];
    [v13 dataSessionRequestStarted:self];
  }
}

- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WiFiAwareDataSession *)self delegate];
  [v8 dataSession:self confirmedForPeerDataAddress:v7 serviceSpecificInfo:v6];
}

- (void)datapathReceivedControlDataAddress:(id)a3 serviceSpecificInfo:(id)a4 onInterfaceIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id v8 = a4;
  id v9 = [(WiFiAwareDataSession *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 dataSession:self receivedControlDataAddress:v10 serviceSpecificInfo:v8 onInterfaceIndex:v5];
  }
}

- (int64_t)internetSharingPolicy
{
  return self->_internetSharingPolicy;
}

- (void)datapathUpdatedInternetSharingPolicy:(int64_t)a3
{
  self->_internetSharingPolicy = a3;
}

- (void)datapathUpdatedPeerRSSI:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(WiFiAwareDataSession *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 dataSession:self updatedPeerRSSI:v3];
  }
}

- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(WiFiAwareDataSession *)self pairingDelegate];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  v12[4] = __Block_byref_object_dispose_;
  id v13 = (id)MEMORY[0x1C187F470](v6);
  if (v7)
  {
    switch(a3)
    {
      case 1:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_11;
        }
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke;
        v11[3] = &unk_1E633EC58;
        v11[4] = v12;
        [v7 pairingRequestStartedForDataSession:self pinCodeInputCompletionHandler:v11];
        break;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_11;
        }
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_2;
        v10[3] = &unk_1E633EC80;
        v10[4] = v12;
        [v7 pairingRequestStartedForDataSession:self passphraseInputCompletionHandler:v10];
        break;
      case 3:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_11;
        }
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_3;
        v9[3] = &unk_1E633ECA8;
        void v9[4] = v12;
        [v7 pairingRequestStartedForDataSession:self qrCodeScannedCompletionHandler:v9];
        break;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_11;
        }
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_4;
        v8[3] = &unk_1E633ECA8;
        v8[4] = v12;
        [v7 pairingRequestStartedForDataSession:self nfcTagScannedCompletionHandler:v8];
        break;
      default:
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v6[2](v6, 0);
  }
  _Block_object_dispose(v12, 8);
}

void __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 40);
  if (a2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a2, "unsignedIntegerValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v7 dataUsingEncoding:4];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    id v5 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v6 = *(void *)(v2 + 40);
    v5(v6);
  }
}

void __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 dataUsingEncoding:4];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

uint64_t __115__WiFiAwareDataSession_datapathPairingRequestStartedWithPairingMethod_pairingAuthenticationInputCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)datapathFailedToStartWithError:(int64_t)a3
{
  [(WiFiAwareDataSession *)self resetState];
  id v5 = [(WiFiAwareDataSession *)self delegate];
  [v5 dataSession:self failedToStartWithError:a3];

  xpcConnection = self->_xpcConnection;
  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (void)datapathTerminatedWithReason:(int64_t)a3
{
  [(WiFiAwareDataSession *)self resetState];
  id v5 = [(WiFiAwareDataSession *)self delegate];
  [v5 dataSession:self terminatedWithReason:a3];

  xpcConnection = self->_xpcConnection;
  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSData)pmk
{
  return self->_pmk;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
}

- (WiFiAwareDataSessionPairingDelegate)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);
  return (WiFiAwareDataSessionPairingDelegate *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (int64_t)pairingMethod
{
  return self->_pairingMethod;
}

- (void)setPairingMethod:(int64_t)a3
{
  self->_pairingMethod = a3;
}

- (BOOL)pairingCachingEnabled
{
  return self->_pairingCachingEnabled;
}

- (void)setPairingCachingEnabled:(BOOL)a3
{
  self->_pairingCachingEnabled = a3;
}

- (WiFiAwarePublishServiceSpecificInfo)pairSetupServiceSpecificInfo
{
  return self->_pairSetupServiceSpecificInfo;
}

- (void)setPairSetupServiceSpecificInfo:(id)a3
{
}

- (WiFiAwareDataSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WiFiAwareDataSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pairSetupServiceSpecificInfo, 0);
  objc_destroyWeak((id *)&self->_pairingDelegate);
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_pmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
  objc_storeStrong((id *)&self->_initiatorDataAddress, 0);
  objc_storeStrong((id *)&self->_datapathID, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end