@interface WiFiP2PTrafficRegistrationReservation
- (BOOL)showsUIAlertOnError;
- (NSString)service;
- (id)initForService:(id)a3;
- (id)remoteObjectInterface;
- (id)trafficRegistrationConfiguration;
- (void)activateWithCompletion:(id)a3;
- (void)handleConnectionEstablishedWithProxy:(id)a3;
- (void)invalidate;
- (void)setShowsUIAlertOnError:(BOOL)a3;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
@end

@implementation WiFiP2PTrafficRegistrationReservation

- (id)initForService:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WiFiP2PTrafficRegistrationReservation;
  v5 = [(WiFiP2PTrafficRegistrationReservation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    service = v5->_service;
    v5->_service = (NSString *)v6;

    v5->_showsUIAlertOnError = 0;
    v5->_enabledCount = 0;
    v8 = [WiFiP2PXPCConnection alloc];
    v9 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.TrafficRegistrationReservation", 0, v9);
    uint64_t v11 = [(WiFiP2PXPCConnection *)v8 initWithEndpointType:0 queue:v10 retryTimeout:+[WiFiP2PXPCConnection defaultRetryTimeout]];
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (WiFiP2PXPCConnection *)v11;

    [(WiFiP2PXPCConnection *)v5->_xpcConnection setDelegate:v5];
  }

  return v5;
}

- (id)trafficRegistrationConfiguration
{
  v3 = [AWDLTrafficRegistrationConfiguration alloc];
  id v4 = [(WiFiP2PTrafficRegistrationReservation *)self service];
  v5 = +[WiFiMACAddress zeroAddress];
  uint64_t v6 = [(AWDLTrafficRegistrationConfiguration *)v3 initWithUniqueIdentifier:v4 peerAddress:v5];

  if ([(WiFiP2PTrafficRegistrationReservation *)self showsUIAlertOnError]) {
    [(AWDLTrafficRegistrationConfiguration *)v6 setOptions:[(AWDLTrafficRegistrationConfiguration *)v6 options] | 4];
  }
  return v6;
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  id v6 = a3;
  if (self->_enabledCount)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(WiFiP2PTrafficRegistrationReservation *)self trafficRegistrationConfiguration];
      [v6 reserveTrafficRegistrationsForConfiguration:v5 enabled:1 completionHandler:&__block_literal_global_194];

      ++v4;
    }
    while (v4 < self->_enabledCount);
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiP2PTrafficRegistrationReservation *)self trafficRegistrationConfiguration];
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke;
  v11[3] = &unk_1E633F4B0;
  v11[4] = self;
  id v12 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke_2;
  v9[3] = &unk_1E633F4D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  id v8 = v5;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v11 clientErrorHandler:v9];
}

uint64_t __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 reserveTrafficRegistrationsForConfiguration:*(void *)(a1 + 40) enabled:1 completionHandler:a3];
}

uint64_t __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    --*(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 16)) {
      [*(id *)(v3 + 8) stop];
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)invalidate
{
  uint64_t v3 = [(WiFiP2PTrafficRegistrationReservation *)self trafficRegistrationConfiguration];
  xpcConnection = self->_xpcConnection;
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke;
  v7[3] = &unk_1E633F4B0;
  v7[4] = self;
  id v8 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke_2;
  v6[3] = &unk_1E633F500;
  id v5 = v3;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v7 clientErrorHandler:v6];
}

void __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke(uint64_t a1, void *a2, void (**a3)(void))
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    *(void *)(v4 + 16) = v5 - 1;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = a3;
    objc_msgSend(a2, "reserveTrafficRegistrationsForConfiguration:enabled:completionHandler:", v7, 0);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = a3;
    id v10 = [v8 errorWithDomain:@"com.apple.wifip2pd" code:2 userInfo:0];
    a3[2](v9);
  }
}

uint64_t __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 16)) {
    return [*(id *)(v1 + 8) stop];
  }
  return result;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18156B8];
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)showsUIAlertOnError
{
  return self->_showsUIAlertOnError;
}

- (void)setShowsUIAlertOnError:(BOOL)a3
{
  self->_showsUIAlertOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end