@interface RSPeerToPeerConnectionController
- (BOOL)_shouldInteractWithPeer:(id)a3;
- (MCPeerID)localPeerID;
- (MCSession)session;
- (NSMutableArray)alreadyConnectedPeerIDs;
- (RSPeerToPeerConnectionController)initWithDataSource:(id)a3;
- (RSPeerToPeerConnectionControllerDataSource)dataSource;
- (RSPeerToPeerConnectionControllerDelegate)delegate;
- (id)_connectedPeerWithDisplayName:(id)a3;
- (id)_stateDataWithRequestType:(unint64_t)a3 stateContent:(id)a4 info:(id)a5;
- (void)_sendData:(id)a3 toPeers:(id)a4;
- (void)abort;
- (void)attemptConnectionWithPeer:(id)a3 successBlock:(id)a4;
- (void)dealloc;
- (void)prepareForConnection;
- (void)requestState:(id)a3 fromPeer:(id)a4;
- (void)sendState:(id)a3 withInfo:(id)a4 toPeer:(id)a5;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5;
- (void)setAlreadyConnectedPeerIDs:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalPeerID:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation RSPeerToPeerConnectionController

- (RSPeerToPeerConnectionController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RSPeerToPeerConnectionController;
  v5 = [(RSPeerToPeerConnectionController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (void)prepareForConnection
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v3 = (void *)getMCPeerIDClass_softClass;
  uint64_t v24 = getMCPeerIDClass_softClass;
  if (!getMCPeerIDClass_softClass)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getMCPeerIDClass_block_invoke;
    v19 = &unk_26471F580;
    v20 = &v21;
    __getMCPeerIDClass_block_invoke((uint64_t)&v16);
    v3 = (void *)v22[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v21, 8);
  id v5 = [v4 alloc];
  v6 = [(RSPeerToPeerConnectionController *)self dataSource];
  v7 = [v6 localPeerDisplayName];
  objc_super v8 = (void *)[v5 initWithDisplayName:v7];

  [(RSPeerToPeerConnectionController *)self setLocalPeerID:v8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v9 = (void *)getMCSessionClass_softClass;
  uint64_t v24 = getMCSessionClass_softClass;
  if (!getMCSessionClass_softClass)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getMCSessionClass_block_invoke;
    v19 = &unk_26471F580;
    v20 = &v21;
    __getMCSessionClass_block_invoke((uint64_t)&v16);
    v9 = (void *)v22[3];
  }
  v10 = v9;
  _Block_object_dispose(&v21, 8);
  id v11 = [v10 alloc];
  v12 = [(RSPeerToPeerConnectionController *)self localPeerID];
  v13 = (void *)[v11 initWithPeer:v12 securityIdentity:0 encryptionPreference:2];

  [(RSPeerToPeerConnectionController *)self setSession:v13];
  v14 = [(RSPeerToPeerConnectionController *)self session];
  [v14 setDelegate:self];

  v15 = [MEMORY[0x263EFF980] array];
  [(RSPeerToPeerConnectionController *)self setAlreadyConnectedPeerIDs:v15];
}

- (void)abort
{
  v3 = [(RSPeerToPeerConnectionController *)self session];
  [v3 setDelegate:0];

  id v4 = [(RSPeerToPeerConnectionController *)self session];
  [v4 disconnect];

  [(RSPeerToPeerConnectionController *)self setSession:0];
  [(RSPeerToPeerConnectionController *)self setLocalPeerID:0];
  [(RSPeerToPeerConnectionController *)self setAlreadyConnectedPeerIDs:0];
}

- (void)dealloc
{
  [(RSPeerToPeerConnectionController *)self abort];
  v3.receiver = self;
  v3.super_class = (Class)RSPeerToPeerConnectionController;
  [(RSPeerToPeerConnectionController *)&v3 dealloc];
}

- (void)attemptConnectionWithPeer:(id)a3 successBlock:(id)a4
{
  v7 = (uint64_t (**)(id))a4;
  uint64_t v6 = [(RSPeerToPeerConnectionController *)self _shouldInteractWithPeer:a3];
  if (v7 && v6) {
    uint64_t v6 = v7[2](v7);
  }
  MEMORY[0x270F9A758](v6);
}

- (void)sendState:(id)a3 withInfo:(id)a4 toPeer:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];

  if (v11)
  {
    v12 = [(RSPeerToPeerConnectionController *)self _stateDataWithRequestType:2 stateContent:v8 info:v9];
    if (v12)
    {
      if (v10)
      {
        v22[0] = v10;
        uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      }
      else
      {
        uint64_t v13 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
      }
      uint64_t v17 = (void *)v13;
      [(RSPeerToPeerConnectionController *)self _sendData:v12 toPeers:v13];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [v10 displayName];
    int v18 = 138412546;
    v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ no conneted peers, cannot send state to peer %@.", (uint8_t *)&v18, 0x16u);
  }
}

- (void)requestState:(id)a3 fromPeer:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RSPeerToPeerConnectionController *)self session];
  id v9 = [v8 connectedPeers];

  if (!v9)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    v14 = [v7 displayName];
    int v16 = 138412546;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ no conneted peers, cannot request state from peer %@.", (uint8_t *)&v16, 0x16u);

LABEL_10:
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v15 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v15);
    int v16 = 138412290;
    uint64_t v17 = v13;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ cannot request state, source peer was not specified.", (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  id v10 = [(RSPeerToPeerConnectionController *)self _stateDataWithRequestType:1 stateContent:0 info:v6];
  if (v10)
  {
    v20[0] = v7;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(RSPeerToPeerConnectionController *)self _sendData:v10 toPeers:v11];
  }
LABEL_11:
}

- (BOOL)_shouldInteractWithPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(RSPeerToPeerConnectionController *)self localPeerID];

  if (!v5)
  {
    [(RSPeerToPeerConnectionController *)self prepareForConnection];
    goto LABEL_5;
  }
  id v6 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
  id v7 = [v6 valueForKey:@"displayName"];
  id v8 = [v4 displayName];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
LABEL_5:
    char v13 = 0;
    goto LABEL_6;
  }
  id v10 = [(RSPeerToPeerConnectionController *)self dataSource];
  id v11 = [v10 allowedRemotePeerDisplayNames];
  v12 = [v4 displayName];
  char v13 = [v11 containsObject:v12];

LABEL_6:
  return v13;
}

- (id)_connectedPeerWithDisplayName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__RSPeerToPeerConnectionController__connectedPeerWithDisplayName___block_invoke;
  v13[3] = &unk_26471F5E0;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v13];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412546;
      int v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ Peer display name %@ was not found to be amongst connected ones.", buf, 0x16u);
    }
    id v10 = 0;
  }
  else
  {
    id v11 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
    id v10 = [v11 objectAtIndex:v7];
  }
  return v10;
}

uint64_t __66__RSPeerToPeerConnectionController__connectedPeerWithDisplayName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 displayName];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (id)_stateDataWithRequestType:(unint64_t)a3 stateContent:(id)a4 info:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v10 = [v8 dictionary];
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:v11 forKey:@"RSStateEncodedRequestTypeKey"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "stateType"));
  [v10 setObject:v12 forKey:@"RSStateEncodedStateTypeKey"];

  char v13 = NSNumber;
  uint64_t v14 = [v9 actionRevision];

  v15 = [v13 numberWithInteger:v14];
  [v10 setObject:v15 forKey:@"RSStateEncodedRevisionKey"];

  if (v7) {
    [v10 setObject:v7 forKey:@"RSStateEncodedContentKey"];
  }
  id v23 = 0;
  int v16 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:0 error:&v23];
  id v17 = v23;
  if (v16)
  {
    id v18 = v16;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    __int16 v20 = NSStringFromClass(v19);
    uint64_t v21 = [v17 localizedDescription];
    *(_DWORD *)buf = 138412802;
    v25 = v20;
    __int16 v26 = 2112;
    v27 = v21;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ json data encoding error: %@ for state %@.", buf, 0x20u);
  }
  return v16;
}

- (void)_sendData:(id)a3 toPeers:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RSPeerToPeerConnectionController *)self session];
  id v13 = 0;
  [v8 sendData:v7 toPeers:v6 withMode:0 error:&v13];

  id v9 = v13;
  if (v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    v12 = [v9 localizedDescription];
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "RSDK-%@ data transmission failure error: %@.", buf, 0x16u);
  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v18 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 0:
      v12 = [(RSPeerToPeerConnectionController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        uint64_t v14 = [(RSPeerToPeerConnectionController *)self delegate];
        [v14 didDisconnectFromRemotePeer:v8];
      }
      id v11 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
      [v11 removeObject:v8];
      goto LABEL_12;
    case 2:
      v15 = [(RSPeerToPeerConnectionController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = [(RSPeerToPeerConnectionController *)self delegate];
        [v17 didConnectToRemotePeer:v8];
      }
      id v11 = [(RSPeerToPeerConnectionController *)self alreadyConnectedPeerIDs];
      [v11 addObject:v8];
      goto LABEL_12;
    case 1:
      id v9 = [(RSPeerToPeerConnectionController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = [(RSPeerToPeerConnectionController *)self delegate];
        [v11 willConnectToRemotePeer:v8];
LABEL_12:
      }
      break;
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a5;
  if (a4)
  {
    id v39 = 0;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:a4 options:0 error:&v39];
    id v9 = v39;
    if (v8)
    {
      char v10 = [v8 objectForKey:@"RSStateEncodedRequestTypeKey"];
      uint64_t v11 = [v10 integerValue];

      v12 = [v8 objectForKey:@"RSStateEncodedStateTypeKey"];
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = [v8 objectForKey:@"RSStateEncodedRevisionKey"];
      uint64_t v15 = [v14 integerValue];

      char v16 = [[RSStateInfo alloc] initWithType:v13 revision:v15];
      if (v11 == 2)
      {
        __int16 v28 = [v8 objectForKey:@"RSStateEncodedContentKey"];
        id v29 = [(RSPeerToPeerConnectionController *)self delegate];
        uint64_t v30 = [v7 displayName];
        [v29 didReceiveState:v28 withInfo:v16 fromPeer:v30];
      }
      else
      {
        if (v11 == 1)
        {
          id v17 = [(RSPeerToPeerConnectionController *)self dataSource];
          id v18 = [v17 supportedStateTypes];
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v13];
          int v20 = [v18 containsObject:v19];

          if (v20)
          {
            uint64_t v21 = [(RSPeerToPeerConnectionController *)self dataSource];
            char v22 = objc_opt_respondsToSelector();

            if (v22)
            {
              id v23 = [(RSPeerToPeerConnectionController *)self dataSource];
              uint64_t v24 = [(RSStateInfo *)v16 stateType];
              v36[0] = MEMORY[0x263EF8330];
              v36[1] = 3221225472;
              v36[2] = __68__RSPeerToPeerConnectionController_session_didReceiveData_fromPeer___block_invoke;
              v36[3] = &unk_26471F608;
              v36[4] = self;
              v37 = v16;
              id v38 = v7;
              [v23 stateForStateType:v24 withCompletionHandler:v36];
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
            v34 = [(RSPeerToPeerConnectionController *)self localPeerID];
            v35 = [v34 displayName];
            *(_DWORD *)buf = 138412802;
            v41 = v33;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v35;
            __int16 v44 = 2048;
            uint64_t v45 = v13;
            _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Peer %@ doens't support state type %lul", buf, 0x20u);
          }
          goto LABEL_14;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          __int16 v26 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v26;
          __int16 v42 = 2048;
          uint64_t v43 = v11;
          _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Unable to handle unkown request type: %lul.", buf, 0x16u);
LABEL_13:
        }
      }
LABEL_14:

      goto LABEL_15;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      goto LABEL_16;
    }
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    char v16 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
    __int16 v26 = [v7 displayName];
    v27 = [v9 localizedDescription];
    *(_DWORD *)buf = 138412802;
    v41 = v16;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v26;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v27;
    _os_log_impl(&dword_2255F7000, &_os_log_internal, OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Unable to serialize JSON data received from %@. %@.", buf, 0x20u);

    goto LABEL_13;
  }
LABEL_16:
}

uint64_t __68__RSPeerToPeerConnectionController_session_didReceiveData_fromPeer___block_invoke(uint64_t result, int a2, uint64_t a3)
{
  if (a3)
  {
    if (a2) {
      return objc_msgSend(*(id *)(result + 32), "sendState:withInfo:toPeer:");
    }
  }
  return result;
}

- (RSPeerToPeerConnectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RSPeerToPeerConnectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCPeerID)localPeerID
{
  return self->_localPeerID;
}

- (void)setLocalPeerID:(id)a3
{
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSMutableArray)alreadyConnectedPeerIDs
{
  return self->_alreadyConnectedPeerIDs;
}

- (void)setAlreadyConnectedPeerIDs:(id)a3
{
}

- (RSPeerToPeerConnectionControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (RSPeerToPeerConnectionControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_alreadyConnectedPeerIDs, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localPeerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end