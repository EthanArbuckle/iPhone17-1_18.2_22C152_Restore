@interface RSPeerToPeerServerController
- (BOOL)advertiserDidNotStartAdvertising;
- (BOOL)didStartAcceptingConnections;
- (MCNearbyServiceAdvertiser)serviceAdvertiser;
- (void)abort;
- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4;
- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6;
- (void)prepareForConnection;
- (void)setAdvertiserDidNotStartAdvertising:(BOOL)a3;
- (void)setServiceAdvertiser:(id)a3;
@end

@implementation RSPeerToPeerServerController

- (void)prepareForConnection
{
  if (self->_serviceAdvertiser) {
    [(RSPeerToPeerServerController *)self abort];
  }
  v10.receiver = self;
  v10.super_class = (Class)RSPeerToPeerServerController;
  [(RSPeerToPeerConnectionController *)&v10 prepareForConnection];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v3 = (void *)getMCNearbyServiceAdvertiserClass_softClass;
  uint64_t v15 = getMCNearbyServiceAdvertiserClass_softClass;
  if (!getMCNearbyServiceAdvertiserClass_softClass)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getMCNearbyServiceAdvertiserClass_block_invoke;
    v11[3] = &unk_26471F580;
    v11[4] = &v12;
    __getMCNearbyServiceAdvertiserClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = v3;
  _Block_object_dispose(&v12, 8);
  id v5 = [v4 alloc];
  v6 = [(RSPeerToPeerConnectionController *)self localPeerID];
  v7 = (void *)[v5 initWithPeer:v6 discoveryInfo:0 serviceType:@"RS-StateDmpSrvc"];

  [(RSPeerToPeerServerController *)self setServiceAdvertiser:v7];
  v8 = [(RSPeerToPeerServerController *)self serviceAdvertiser];
  [v8 setDelegate:self];

  v9 = [(RSPeerToPeerServerController *)self serviceAdvertiser];
  [v9 startAdvertisingPeer];
}

- (void)abort
{
  v5.receiver = self;
  v5.super_class = (Class)RSPeerToPeerServerController;
  [(RSPeerToPeerConnectionController *)&v5 abort];
  v3 = [(RSPeerToPeerServerController *)self serviceAdvertiser];
  [v3 setDelegate:0];

  v4 = [(RSPeerToPeerServerController *)self serviceAdvertiser];
  [v4 stopAdvertisingPeer];

  [(RSPeerToPeerServerController *)self setServiceAdvertiser:0];
  self->_advertiserDidNotStartAdvertising = 0;
}

- (BOOL)didStartAcceptingConnections
{
  return self->_serviceAdvertiser && !self->_advertiserDidNotStartAdvertising;
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  id v8 = a6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__RSPeerToPeerServerController_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke;
  v10[3] = &unk_26471F648;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(RSPeerToPeerConnectionController *)self attemptConnectionWithPeer:a4 successBlock:v10];
}

void __102__RSPeerToPeerServerController_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) session];
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v2);
}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_advertiserDidNotStartAdvertising = 1;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    id v5 = a4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v5 localizedDescription];

    int v9 = 138412546;
    objc_super v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ advertiser did not start advertising peer %@.", (uint8_t *)&v9, 0x16u);
  }
}

- (MCNearbyServiceAdvertiser)serviceAdvertiser
{
  return self->_serviceAdvertiser;
}

- (void)setServiceAdvertiser:(id)a3
{
}

- (BOOL)advertiserDidNotStartAdvertising
{
  return self->_advertiserDidNotStartAdvertising;
}

- (void)setAdvertiserDidNotStartAdvertising:(BOOL)a3
{
  self->_advertiserDidNotStartAdvertising = a3;
}

- (void).cxx_destruct
{
}

@end