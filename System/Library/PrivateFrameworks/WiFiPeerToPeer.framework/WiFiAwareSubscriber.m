@interface WiFiAwareSubscriber
- (NSString)description;
- (WiFiAwareSubscribeConfiguration)configuration;
- (WiFiAwareSubscriber)initWithConfiguration:(id)a3;
- (WiFiAwareSubscriberDelegate)delegate;
- (id)exportedInterface;
- (id)remoteObjectInterface;
- (void)handleError:(int64_t)a3;
- (void)sendMessage:(id)a3 toPeerAddress:(id)a4 withInstanceID:(unsigned __int8)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
- (void)stop;
- (void)subscribeFailedToStartWithError:(int64_t)a3;
- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4;
- (void)subscribeReceivedDiscoveryResult:(id)a3;
- (void)subscribeReceivedMessage:(id)a3 fromPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscribeStartedWithInstanceID:(unsigned __int8)a3;
- (void)subscribeTerminatedWithReason:(int64_t)a3;
@end

@implementation WiFiAwareSubscriber

- (WiFiAwareSubscriber)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WiFiAwareSubscriber;
  v6 = [(WiFiAwareSubscriber *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [WiFiP2PXPCConnection alloc];
    v9 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwareSubscriber", 0, v9);
    uint64_t v11 = [(WiFiP2PXPCConnection *)v8 initWithEndpointType:1 queue:v10 retryTimeout:+[WiFiP2PXPCConnection defaultRetryTimeout]];
    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = (WiFiP2PXPCConnection *)v11;

    [(WiFiP2PXPCConnection *)v7->_xpcConnection setDelegate:v7];
  }

  return v7;
}

- (void)handleError:(int64_t)a3
{
  id v5 = [(WiFiAwareSubscriber *)self delegate];
  id v7 = v5;
  if (self->_subscribeID) {
    [v5 subscriber:self terminatedWithReason:-1];
  }
  else {
    [v5 subscriber:self failedToStartWithError:a3];
  }
  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815478];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1811E08];
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WiFiAwareSubscriber *)self configuration];
  [v7 createSubscribeWithConfiguration:v8 completionHandler:v6];
}

- (void)start
{
}

- (void)stop
{
}

uint64_t __27__WiFiAwareSubscriber_stop__block_invoke(uint64_t a1, void *a2)
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
  v15[2] = __82__WiFiAwareSubscriber_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke;
  v15[3] = &unk_1E633ECF0;
  id v16 = v10;
  id v17 = v11;
  unsigned __int8 v18 = a5;
  id v13 = v11;
  id v14 = v10;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v15 clientCompletionHandler:a6];
}

uint64_t __82__WiFiAwareSubscriber_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 sendMessage:*(void *)(a1 + 32) toPeerAddress:*(void *)(a1 + 40) withInstanceID:*(unsigned __int8 *)(a1 + 48) completionHandler:a3];
}

- (NSString)description
{
  subscribeID = self->_subscribeID;
  if (subscribeID)
  {
    v4 = [NSString stringWithFormat:@"%@", subscribeID];
  }
  else
  {
    v4 = @"unset";
  }
  id v5 = NSString;
  id v6 = [(WiFiAwareSubscriber *)self configuration];
  id v7 = [v6 serviceName];
  id v8 = [v5 stringWithFormat:@"<WiFiAwareSubscriber: SubscribeID=%@, Service=%@>", v4, v7];

  return (NSString *)v8;
}

- (void)subscribeStartedWithInstanceID:(unsigned __int8)a3
{
  subscribeID = self->_subscribeID;
  id v5 = [NSNumber numberWithUnsignedChar:a3];
  id v6 = self->_subscribeID;
  self->_subscribeID = v5;

  if (!subscribeID)
  {
    id v7 = [(WiFiAwareSubscriber *)self delegate];
    [v7 subscriberStarted:self];
  }
}

- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(WiFiAwareSubscriber *)self delegate];
  [v7 subscriber:self lostDiscoveryResultForPublishID:v4 address:v6];
}

- (void)subscribeReceivedDiscoveryResult:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WiFiAwareSubscriber *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 subscriber:self receivedDiscoveryResult:v4];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 subscriber:self receivedDiscoveyResult:v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v5;
      _os_log_error_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "WiFiAwareSubscriberDelegate %{public}@ is using deprecated method - (void)subscriber:receivedDiscoveyResult: should be using - (void)subscriber:receivedDiscoveryResult: instead.", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v6 = 138543362;
    id v7 = v5;
    _os_log_fault_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "WiFiAwareSubscriberDelegate %{public}@ is missing required method - (void)subscriber:receivedDiscoveryResult:", (uint8_t *)&v6, 0xCu);
  }
}

- (void)subscribeTerminatedWithReason:(int64_t)a3
{
  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;

  int v6 = [(WiFiAwareSubscriber *)self delegate];
  [v6 subscriber:self terminatedWithReason:a3];

  xpcConnection = self->_xpcConnection;

  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (void)subscribeFailedToStartWithError:(int64_t)a3
{
  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;

  int v6 = [(WiFiAwareSubscriber *)self delegate];
  [v6 subscriber:self failedToStartWithError:a3];

  xpcConnection = self->_xpcConnection;

  [(WiFiP2PXPCConnection *)xpcConnection stop];
}

- (void)subscribeReceivedMessage:(id)a3 fromPublishID:(unsigned __int8)a4 address:(id)a5
{
  uint64_t v6 = a4;
  id v10 = a3;
  id v8 = a5;
  v9 = [(WiFiAwareSubscriber *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 subscriber:self receivedMessage:v10 fromPublishID:v6 address:v8];
  }
}

- (WiFiAwareSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiFiAwareSubscriberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WiFiAwareSubscribeConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscribeID, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end