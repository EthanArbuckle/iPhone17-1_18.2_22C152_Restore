@interface SFAirDropClassroomTransferManager
- (BOOL)shouldEscapeXpcTryCatch;
- (SFAirDropClassroomTransferDelegate)delegate;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)transferWithIdentifierWasAccepted:(id)a3;
- (void)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4;
- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6;
@end

@implementation SFAirDropClassroomTransferManager

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SFAirDropClassroomTransferManager;
  [(SFXPCClient *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SFAirDropClassroomTransferManager;
  [(SFXPCClient *)&v2 _invalidate];
}

- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = _os_activity_create(&dword_1A5389000, "Sharing/SFAirDropClassroomTransferManager/updateTransferWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke;
  v17[3] = &unk_1E5BBEAC8;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  int64_t v21 = a4;
  id v15 = v11;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  [(SFAirDropClassroomTransferManager *)self _getRemoteObjectProxyOnQueue:v17];

  os_activity_scope_leave(&state);
}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 dispatchQueue];
  dispatch_assert_queue_V2(v5);

  v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[8];
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v7;
    __int16 v21 = 1024;
    int v22 = v8;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "updating daemon with transfer %@ with state %d", buf, 0x12u);
  }

  uint64_t v9 = a1[8];
  id v10 = (void *)a1[5];
  uint64_t v11 = a1[6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_120;
  v15[3] = &unk_1E5BBEAA0;
  id v12 = v10;
  id v14 = (void *)a1[7];
  uint64_t v13 = a1[8];
  id v16 = v12;
  uint64_t v18 = v13;
  id v17 = v14;
  [v4 updateTransferWithIdentifier:v12 withState:v9 information:v11 completionHandler:v15];
}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_120(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = airdrop_log();
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      uint64_t v12 = a1[6];
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "updated daemon with transfer %@ with state %d", (uint8_t *)&v13, 0x12u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_120_cold_1((uint64_t)a1, (uint64_t)v7, v10);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)transferWithIdentifierWasAccepted:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "transferWithIdentifierWasAccepted %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(SFAirDropClassroomTransferManager *)self delegate];
  [v6 transferWithIdentifierWasAccepted:v4];
}

- (void)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "transferWithIdentifierWasDeclined %@, withFailureReason: %d", (uint8_t *)&v13, 0x12u);
  }

  id v8 = [(SFAirDropClassroomTransferManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  id v10 = [(SFAirDropClassroomTransferManager *)self delegate];
  uint64_t v11 = v10;
  if (v9)
  {
    [v10 transferWithIdentifierWasDeclined:v6 withFailureReason:a4];
LABEL_7:

    goto LABEL_8;
  }
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v11 = [(SFAirDropClassroomTransferManager *)self delegate];
    [v11 transferWithIdentifierWasDeclined:v6];
    goto LABEL_7;
  }
LABEL_8:
}

- (id)machServiceName
{
  return @"com.apple.sharing.classroom-transfer";
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA1AC88];
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39380];
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFAirDropClassroomTransferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAirDropClassroomTransferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_120_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Failed to update daemon with transfer %@ (%@)", (uint8_t *)&v4, 0x16u);
}

@end