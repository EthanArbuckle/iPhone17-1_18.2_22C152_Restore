@interface RSPeerToPeerClientController
- (MCNearbyServiceBrowser)serviceBrowser;
- (void)abort;
- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4;
- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5;
- (void)browser:(id)a3 lostPeer:(id)a4;
- (void)prepareForConnection;
- (void)setServiceBrowser:(id)a3;
@end

@implementation RSPeerToPeerClientController

- (void)prepareForConnection
{
  if (self->_serviceBrowser) {
    [(RSPeerToPeerClientController *)self abort];
  }
  v10.receiver = self;
  v10.super_class = (Class)RSPeerToPeerClientController;
  [(RSPeerToPeerConnectionController *)&v10 prepareForConnection];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v3 = (void *)getMCNearbyServiceBrowserClass_softClass;
  uint64_t v15 = getMCNearbyServiceBrowserClass_softClass;
  if (!getMCNearbyServiceBrowserClass_softClass)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getMCNearbyServiceBrowserClass_block_invoke;
    v11[3] = &unk_26471F580;
    v11[4] = &v12;
    __getMCNearbyServiceBrowserClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = v3;
  _Block_object_dispose(&v12, 8);
  id v5 = [v4 alloc];
  v6 = [(RSPeerToPeerConnectionController *)self localPeerID];
  v7 = (void *)[v5 initWithPeer:v6 serviceType:@"RS-StateDmpSrvc"];

  [(RSPeerToPeerClientController *)self setServiceBrowser:v7];
  v8 = [(RSPeerToPeerClientController *)self serviceBrowser];
  [v8 setDelegate:self];

  v9 = [(RSPeerToPeerClientController *)self serviceBrowser];
  [v9 startBrowsingForPeers];
}

- (void)abort
{
  v5.receiver = self;
  v5.super_class = (Class)RSPeerToPeerClientController;
  [(RSPeerToPeerConnectionController *)&v5 abort];
  v3 = [(RSPeerToPeerClientController *)self serviceBrowser];
  [v3 setDelegate:0];

  v4 = [(RSPeerToPeerClientController *)self serviceBrowser];
  [v4 stopBrowsingForPeers];

  [(RSPeerToPeerClientController *)self setServiceBrowser:0];
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__RSPeerToPeerClientController_browser_foundPeer_withDiscoveryInfo___block_invoke;
  v11[3] = &unk_26471F558;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  id v9 = v8;
  id v10 = v7;
  [(RSPeerToPeerConnectionController *)self attemptConnectionWithPeer:v9 successBlock:v11];
}

void __68__RSPeerToPeerClientController_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) session];
  [v1 invitePeer:v2 toSession:v3 withContext:0 timeout:5.0];
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    id v5 = a4;
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [v5 displayName];

    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ browser did lost peer %@.", (uint8_t *)&v9, 0x16u);
  }
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    id v5 = a4;
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [v5 localizedDescription];

    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ browser did not start browsing for peers %@.", (uint8_t *)&v9, 0x16u);
  }
}

- (MCNearbyServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (void)setServiceBrowser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end