@interface RPNearFieldPassiveClient
- (id)alwaysOnHandler;
- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3;
- (void)setAlwaysOnHandler:(id)a3;
- (void)startDiscoveryWithApplicationLabels:(id)a3 completion:(id)a4;
@end

@implementation RPNearFieldPassiveClient

- (void)startDiscoveryWithApplicationLabels:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RPNearFieldClient *)self _ensureXPCStarted];
  v9 = [(RPNearFieldClient *)self xpcCnx];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__RPNearFieldPassiveClient_startDiscoveryWithApplicationLabels_completion___block_invoke;
  v17[3] = &unk_1E605B600;
  id v10 = v7;
  id v18 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__RPNearFieldPassiveClient_startDiscoveryWithApplicationLabels_completion___block_invoke_2;
  v14[3] = &unk_1E605BC60;
  id v15 = v6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v6;
  [v11 startPassiveDiscoveryWithApplicationLabels:v13 completion:v14];
}

void __75__RPNearFieldPassiveClient_startDiscoveryWithApplicationLabels_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = MEMORY[0x1B3EBCC80](*(void *)(a1 + 32));
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __75__RPNearFieldPassiveClient_startDiscoveryWithApplicationLabels_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearFieldClient <= 40 {
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v3 = MEMORY[0x1B3EBCC80](*(void *)(a1 + 40));
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_alwaysOnHandler, a2);
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, v3);
    v4 = (void (**)(void, void))v5;
  }
}

- (id)alwaysOnHandler
{
  return self->_alwaysOnHandler;
}

- (void)setAlwaysOnHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end