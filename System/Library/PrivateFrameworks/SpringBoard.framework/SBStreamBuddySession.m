@interface SBStreamBuddySession
- (SBStreamBuddySession)init;
- (SBStreamBuddySessionDelegate)delegate;
- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4;
- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6;
- (void)sendSystemApertureStateDump:(id)a3;
- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6;
- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SBStreamBuddySession

- (SBStreamBuddySession)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBStreamBuddySession;
  v2 = [(SBStreamBuddySession *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F35C80]);
    v4 = [MEMORY[0x1E4F42948] currentDevice];
    v5 = [v4 name];
    uint64_t v6 = [v3 initWithDisplayName:v5];
    myPeerID = v2->_myPeerID;
    v2->_myPeerID = (MCPeerID *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F35C88]) initWithPeer:v2->_myPeerID securityIdentity:0 encryptionPreference:1];
    session = v2->_session;
    v2->_session = (MCSession *)v8;

    [(MCSession *)v2->_session setDelegate:v2];
  }
  return v2;
}

- (void)start
{
  id v3 = (MCNearbyServiceAdvertiser *)[objc_alloc(MEMORY[0x1E4F35C70]) initWithPeer:self->_myPeerID discoveryInfo:0 serviceType:@"StreamBuddy"];
  advertiser = self->_advertiser;
  self->_advertiser = v3;

  [(MCNearbyServiceAdvertiser *)self->_advertiser setDelegate:self];
  [(MCNearbyServiceAdvertiser *)self->_advertiser startAdvertisingPeer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained streamBuddySession:self connectionState:0 withError:0];

  uint64_t v6 = SBLogStreamBuddy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "-[SBStreamBuddySession start]", v7, 2u);
  }
}

- (void)stop
{
  [(MCNearbyServiceAdvertiser *)self->_advertiser stopAdvertisingPeer];
  [(MCSession *)self->_session disconnect];
  advertiser = self->_advertiser;
  self->_advertiser = 0;

  connectedPeer = self->_connectedPeer;
  self->_connectedPeer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained streamBuddySession:self connectionState:1 withError:0];

  uint64_t v6 = SBLogStreamBuddy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "-[SBStreamBuddySession stop]", v7, 2u);
  }
}

- (void)sendSystemApertureStateDump:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_connectedPeer)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28D90];
    v18[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v17 = 0;
    uint64_t v8 = [v6 dataWithJSONObject:v7 options:0 error:&v17];
    v9 = v17;

    if (v8)
    {
      session = self->_session;
      p_session = &self->_session;
      v12 = [(MCSession *)session connectedPeers];
      v16 = v9;
      BOOL v13 = [(MCSession *)session sendData:v8 toPeers:v12 withMode:0 error:&v16];
      v14 = v16;

      if (v13)
      {
LABEL_12:

        goto LABEL_13;
      }
      v15 = SBLogStreamBuddy();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(SBStreamBuddySession *)(id *)p_session sendSystemApertureStateDump:v15];
      }
      v9 = v14;
    }
    else
    {
      v15 = SBLogStreamBuddy();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SBStreamBuddySession sendSystemApertureStateDump:](v15);
      }
    }

    v14 = v9;
    goto LABEL_12;
  }
  v14 = SBLogStreamBuddy();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SBStreamBuddySession sendSystemApertureStateDump:](v14);
  }
LABEL_13:
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, MCSession *))a6;
  objc_super v11 = SBLogStreamBuddy();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    BOOL v13 = [v9 displayName];
    int v14 = 138412546;
    v15 = v12;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%@ peerID.displayName:%@", (uint8_t *)&v14, 0x16u);
  }
  v10[2](v10, 1, self->_session);
}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogStreamBuddy();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v10 = 138412546;
    objc_super v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ Error:%@", (uint8_t *)&v10, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained streamBuddySession:self connectionState:5 withError:v6];
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SBStreamBuddySession_session_peer_didChangeState___block_invoke;
    block[3] = &unk_1E6AF7720;
    int64_t v15 = a5;
    id v12 = WeakRetained;
    id v13 = self;
    id v14 = v8;
    SEL v16 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __52__SBStreamBuddySession_session_peer_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 0:
      [*(id *)(a1 + 32) streamBuddySession:*(void *)(a1 + 40) connectionState:4 withError:0];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = 0;

      id v3 = SBLogStreamBuddy();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
        int v10 = 138412290;
        objc_super v11 = v9;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%@ state:MCSessionStateNotConnected", (uint8_t *)&v10, 0xCu);
      }
      break;
    case 1:
      [*(id *)(a1 + 32) streamBuddySession:*(void *)(a1 + 40) connectionState:3 withError:0];
      id v3 = SBLogStreamBuddy();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
        v5 = [*(id *)(*(void *)(a1 + 40) + 16) displayName];
        int v10 = 138412546;
        objc_super v11 = v4;
        __int16 v12 = 2112;
        id v13 = v5;
        id v6 = "%@ state:MCSessionStateConnecting to %@";
        goto LABEL_10;
      }
      break;
    case 2:
      [*(id *)(a1 + 32) streamBuddySession:*(void *)(a1 + 40) connectionState:2 withError:0];
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 48));
      id v3 = SBLogStreamBuddy();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
        v5 = [*(id *)(*(void *)(a1 + 40) + 16) displayName];
        int v10 = 138412546;
        objc_super v11 = v4;
        __int16 v12 = 2112;
        id v13 = v5;
        id v6 = "%@ state:MCSessionStateConnected to %@";
LABEL_10:
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0x16u);
      }
      break;
    default:
      return;
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogStreamBuddy();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = SBLogStreamBuddy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    __int16 v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogStreamBuddy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    __int16 v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = SBLogStreamBuddy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    int v11 = 138412546;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v11, 0x16u);
  }
}

- (SBStreamBuddySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBStreamBuddySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_connectedPeer, 0);
  objc_storeStrong((id *)&self->_myPeerID, 0);
}

- (void)sendSystemApertureStateDump:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "ERROR: Trying to send data to nowhere.", v1, 2u);
}

- (void)sendSystemApertureStateDump:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "ERROR: Failed to seralize streamBuddyPreferences", v1, 2u);
}

- (void)sendSystemApertureStateDump:(NSObject *)a3 .cold.3(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = [*a1 connectedPeers];
  id v6 = [v5 firstObject];
  id v7 = [v6 displayName];
  int v8 = 138412546;
  int v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "ERROR: Failed to send data to %@ with error: %@", (uint8_t *)&v8, 0x16u);
}

@end