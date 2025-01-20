@interface WiFiAwarePublisher
- (NSString)description;
- (WiFiAwarePublishConfiguration)configuration;
- (WiFiAwarePublisher)initWithConfiguration:(id)a3;
- (WiFiAwarePublisherDelegate)delegate;
- (id)exportedInterface;
- (id)remoteObjectInterface;
- (void)generateStatisticsReportForDataSession:(id)a3 completionHandler:(id)a4;
- (void)handleError:(int64_t)a3;
- (void)publishDataConfirmedForHandle:(id)a3 localInterfaceIndex:(unsigned int)a4 serviceSpecificInfo:(id)a5;
- (void)publishDataTerminatedForHandle:(id)a3 reason:(int64_t)a4;
- (void)publishFailedToStartWithError:(int64_t)a3;
- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5;
- (void)publishReceivedMessage:(id)a3 fromSubscriberID:(unsigned __int8)a4 subscriberAddress:(id)a5;
- (void)publishStartedWithInstanceID:(unsigned __int8)a3;
- (void)publishTerminatedWithReason:(int64_t)a3;
- (void)reportIssue:(id)a3 forDataSession:(id)a4;
- (void)sendMessage:(id)a3 toPeerAddress:(id)a4 withInstanceID:(unsigned __int8)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
- (void)stop;
- (void)terminateDataSession:(id)a3 completionHandler:(id)a4;
- (void)updateDatapathServiceSpecificInfo:(id)a3 completionHandler:(id)a4;
- (void)updateLinkStatus:(int64_t)a3 forDataSession:(id)a4;
- (void)updateServiceSpecificInfo:(id)a3 completionHandler:(id)a4;
@end

@implementation WiFiAwarePublisher

- (WiFiAwarePublisher)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WiFiAwarePublisher;
  v5 = [(WiFiAwarePublisher *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (WiFiAwarePublishConfiguration *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dataSessionHandles = v5->_dataSessionHandles;
    v5->_dataSessionHandles = v8;

    v10 = [WiFiP2PXPCConnection alloc];
    v11 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwarePublisher", 0, v11);
    uint64_t v13 = [(WiFiP2PXPCConnection *)v10 initWithEndpointType:1 queue:v12 retryTimeout:+[WiFiP2PXPCConnection defaultRetryTimeout]];
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (WiFiP2PXPCConnection *)v13;

    [(WiFiP2PXPCConnection *)v5->_xpcConnection setDelegate:v5];
  }

  return v5;
}

- (void)handleError:(int64_t)a3
{
  v5 = [(WiFiAwarePublisher *)self delegate];
  id v7 = v5;
  if (self->_publishID) {
    [v5 publisher:self terminatedWithReason:-1];
  }
  else {
    [v5 publisher:self failedToStartWithError:a3];
  }
  publishID = self->_publishID;
  self->_publishID = 0;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18155F8];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1812FF0];
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WiFiAwarePublisher *)self delegate];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = self->_dataSessionHandles;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "publisher:dataTerminatedForHandle:reason:", self, *(void *)(*((void *)&v15 + 1) + 8 * v13++), -1, (void)v15);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_dataSessionHandles removeAllObjects];
  v14 = [(WiFiAwarePublisher *)self configuration];
  [v6 createPublishWithConfiguration:v14 completionHandler:v7];
}

- (void)start
{
}

- (void)stop
{
}

uint64_t __26__WiFiAwarePublisher_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)sendMessage:(id)a3 toPeerAddress:(id)a4 withInstanceID:(unsigned __int8)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  xpcConnection = self->_xpcConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__WiFiAwarePublisher_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke;
  v15[3] = &unk_1E633F1D0;
  id v16 = v10;
  id v17 = v11;
  unsigned __int8 v18 = a5;
  id v13 = v11;
  id v14 = v10;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v15 clientCompletionHandler:a6];
}

uint64_t __81__WiFiAwarePublisher_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 sendMessage:*(void *)(a1 + 32) toPeerAddress:*(void *)(a1 + 40) withInstanceID:*(unsigned __int8 *)(a1 + 48) completionHandler:a3];
}

- (void)terminateDataSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__WiFiAwarePublisher_terminateDataSession_completionHandler___block_invoke;
  v9[3] = &unk_1E633F1F8;
  id v10 = v6;
  id v8 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v9 clientCompletionHandler:a4];
}

uint64_t __61__WiFiAwarePublisher_terminateDataSession_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 terminateDataSession:*(void *)(a1 + 32) completionHandler:a3];
}

- (void)updateServiceSpecificInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = self;
  xpcConnection = v7->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E633F248;
  id v12 = v6;
  id v13 = v7;
  v9 = v7;
  id v10 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v11 clientCompletionHandler:a4];
}

void __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke_2;
  v8[3] = &unk_1E633F220;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v7 = v5;
  [a2 updateServiceSpecificInfo:v6 completionHandler:v8];
}

void __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)*(id *)(a1 + 32);
  id v5 = v4;
  if (!a2 && v4) {
    [v4[5] setServiceSpecificInfo:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateDatapathServiceSpecificInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = self;
  xpcConnection = v7->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E633F248;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v11 clientCompletionHandler:a4];
}

void __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke_2;
  v8[3] = &unk_1E633F220;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v7 = v5;
  [a2 updateDatapathServiceSpecificInfo:v6 completionHandler:v8];
}

void __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)*(id *)(a1 + 32);
  id v7 = v4;
  if (!a2 && v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v4[5] datapathConfiguration];
    [v6 setServiceSpecificInfo:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)reportIssue:(id)a3 forDataSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__WiFiAwarePublisher_reportIssue_forDataSession___block_invoke;
  v11[3] = &unk_1E633F270;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v11];
}

uint64_t __49__WiFiAwarePublisher_reportIssue_forDataSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reportIssue:*(void *)(a1 + 32) forDataSession:*(void *)(a1 + 40)];
}

- (void)updateLinkStatus:(int64_t)a3 forDataSession:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__WiFiAwarePublisher_updateLinkStatus_forDataSession___block_invoke;
  v9[3] = &unk_1E633F298;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v9];
}

uint64_t __54__WiFiAwarePublisher_updateLinkStatus_forDataSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateLinkStatus:*(void *)(a1 + 40) forDataSession:*(void *)(a1 + 32)];
}

- (void)generateStatisticsReportForDataSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    xpcConnection = self->_xpcConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke;
    v11[3] = &unk_1E633F2C0;
    id v12 = v6;
    id v13 = v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_3;
    v9[3] = &unk_1E633EBE8;
    id v10 = v13;
    [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v11 clientCompletionHandler:v9];
  }
}

void __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_2;
  v8[3] = &unk_1E633EB98;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 generateStatisticsReportForDataSession:v6 completionHandler:v8];
}

void __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)publishStartedWithInstanceID:(unsigned __int8)a3
{
  publishID = self->_publishID;
  id v5 = [NSNumber numberWithUnsignedChar:a3];
  uint64_t v6 = self->_publishID;
  self->_publishID = v5;

  if (!publishID)
  {
    id v7 = [(WiFiAwarePublisher *)self delegate];
    [v7 publisherStarted:self];
  }
}

- (void)publishDataConfirmedForHandle:(id)a3 localInterfaceIndex:(unsigned int)a4 serviceSpecificInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = a5;
  [(NSMutableArray *)self->_dataSessionHandles addObject:v10];
  id v9 = [(WiFiAwarePublisher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 publisher:self dataConfirmedForHandle:v10 localInterfaceIndex:v6 serviceSpecificInfo:v8];
  }
}

- (void)publishDataTerminatedForHandle:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  -[NSMutableArray removeObject:](self->_dataSessionHandles, "removeObject:");
  uint64_t v6 = [(WiFiAwarePublisher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 publisher:self dataTerminatedForHandle:v7 reason:a4];
  }
}

- (void)publishFailedToStartWithError:(int64_t)a3
{
  publishID = self->_publishID;
  self->_publishID = 0;

  uint64_t v6 = [(WiFiAwarePublisher *)self delegate];
  [v6 publisher:self failedToStartWithError:a3];

  xpcConnection = self->_xpcConnection;

  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (void)publishReceivedMessage:(id)a3 fromSubscriberID:(unsigned __int8)a4 subscriberAddress:(id)a5
{
  uint64_t v6 = a4;
  id v10 = a3;
  id v8 = a5;
  id v9 = [(WiFiAwarePublisher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 publisher:self receivedMessage:v10 fromSubscriberID:v6 subscriberAddress:v8];
  }
}

- (void)publishTerminatedWithReason:(int64_t)a3
{
  publishID = self->_publishID;
  self->_publishID = 0;

  uint64_t v6 = [(WiFiAwarePublisher *)self delegate];
  [v6 publisher:self terminatedWithReason:a3];

  xpcConnection = self->_xpcConnection;

  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5
{
  id v24 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [(WiFiAwarePublisher *)self configuration];
  id v10 = [v9 datapathConfiguration];
  int64_t v11 = [v10 securityConfiguration];
  id v12 = [v11 pairingDelegate];

  if (v12)
  {
    switch(a4)
    {
      case 1:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_17;
        }
        int v13 = 6;
        id v14 = [MEMORY[0x1E4F28E78] stringWithCapacity:6];
        do
        {
          objc_msgSend(v14, "appendFormat:", @"%d", arc4random_uniform(0xAu));
          --v13;
        }
        while (v13);
        long long v15 = [v14 dataUsingEncoding:4];
        v8[2](v8, v15);

        id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
        [v12 pairingRequestIndicatedForPublisher:self bySubscriber:v24 usingPINCode:v16];

        goto LABEL_11;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_17;
        }
        int v17 = 8;
        id v14 = [MEMORY[0x1E4F28E78] stringWithCapacity:8];
        do
        {
          [v14 appendFormat:@"%C", objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", "characterAtIndex:", arc4random_uniform(objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", "length")))];
          --v17;
        }
        while (v17);
        unsigned __int8 v18 = [v14 dataUsingEncoding:4];
        v8[2](v8, v18);

        [v12 pairingRequestIndicatedForPublisher:self bySubscriber:v24 usingPassphrase:v14];
LABEL_11:

        break;
      case 3:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_17;
        }
        v19 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v20 = [v19 UUIDString];
        v21 = [v20 dataUsingEncoding:4];

        v8[2](v8, v21);
        [v12 pairingRequestIndicatedForPublisher:self bySubscriber:v24 usingQRCodeInformation:v21];
        goto LABEL_16;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_17;
        }
        v22 = [MEMORY[0x1E4F29128] UUID];
        v23 = [v22 UUIDString];
        v21 = [v23 dataUsingEncoding:4];

        v8[2](v8, v21);
        [v12 pairingRequestIndicatedForPublisher:self bySubscriber:v24 usingNFCTag:v21];
LABEL_16:

        break;
      default:
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    v8[2](v8, 0);
  }
}

- (NSString)description
{
  publishID = self->_publishID;
  if (publishID)
  {
    id v4 = [NSString stringWithFormat:@"%@", publishID];
  }
  else
  {
    id v4 = @"unset";
  }
  id v5 = NSString;
  uint64_t v6 = [(WiFiAwarePublisher *)self configuration];
  id v7 = [v6 serviceName];
  id v8 = [v5 stringWithFormat:@"<WiFiAwarePublisher: PublishID=%@, Service=%@>", v4, v7];

  return (NSString *)v8;
}

- (WiFiAwarePublisherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiFiAwarePublisherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WiFiAwarePublishConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_publishID, 0);
  objc_storeStrong((id *)&self->_dataSessionHandles, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end