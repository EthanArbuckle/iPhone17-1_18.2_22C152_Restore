@interface _SFAirDropTransferObserver
- (BOOL)shouldEscapeXpcTryCatch;
- (NSMutableDictionary)transferIdentifierToTransfer;
- (SFAirDropTransferObserverDelegate)delegate;
- (_SFAirDropTransferObserver)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activate;
- (void)invalidate;
- (void)observeForLocalOnlyPropertiesOnTransfer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserverForLocalOnlyPropertiesOnTransfer:(id)a3;
- (void)removedTransfer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransferIdentifierToTransfer:(id)a3;
- (void)updateActionHandlersOnTransfer:(id)a3;
- (void)updatedTransfer:(id)a3;
@end

@implementation _SFAirDropTransferObserver

- (_SFAirDropTransferObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFAirDropTransferObserver;
  v2 = [(SFXPCClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transferIdentifierToTransfer = v2->_transferIdentifierToTransfer;
    v2->_transferIdentifierToTransfer = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)_SFAirDropTransferObserver;
  [(SFXPCClient *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)_SFAirDropTransferObserver;
  [(SFXPCClient *)&v2 _invalidate];
}

- (void)observeForLocalOnlyPropertiesOnTransfer:(id)a3
{
}

- (void)removeObserverForLocalOnlyPropertiesOnTransfer:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ((void *)SFAirDropTransferObserverContext == a6)
  {
    v11 = [(SFXPCClient *)self dispatchQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77___SFAirDropTransferObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E5BBBD18;
    v12[4] = self;
    id v13 = v10;
    dispatch_async(v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_SFAirDropTransferObserver;
    [(_SFAirDropTransferObserver *)&v14 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)updateActionHandlersOnTransfer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFAirDropTransferObserver/updateActionHandlersOnTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id location = 0;
  objc_initWeak(&location, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke;
  aBlock[3] = &unk_1E5BBBD68;
  aBlock[4] = self;
  objc_copyWeak(&v18, &location);
  objc_super v6 = _Block_copy(aBlock);
  v7 = [v4 selectedAction];
  [v7 setActionHandler:v6];

  v8 = [v4 cancelAction];
  [v8 setActionHandler:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v9 = objc_msgSend(v4, "possibleActions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setActionHandler:v6];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

- (void)updatedTransfer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFAirDropTransferObserver *)self transferIdentifierToTransfer];
  objc_super v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    int v8 = [v7 updateWithTransfer:v4];
    [(_SFAirDropTransferObserver *)self updateActionHandlersOnTransfer:v7];
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = v4;
    [v7 setUpProgress];
    [(_SFAirDropTransferObserver *)self observeForLocalOnlyPropertiesOnTransfer:v7];
    v9 = [(_SFAirDropTransferObserver *)self transferIdentifierToTransfer];
    uint64_t v10 = [v7 identifier];
    [v9 setObject:v7 forKeyedSubscript:v10];

    [(_SFAirDropTransferObserver *)self updateActionHandlersOnTransfer:v7];
  }
  uint64_t v11 = airdrop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v7 identifier];
    int v14 = 138412290;
    long long v15 = v12;
    _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Updated transfer %@", (uint8_t *)&v14, 0xCu);
  }
  long long v13 = [(_SFAirDropTransferObserver *)self delegate];
  [v13 updatedTransfer:v7];

LABEL_8:
}

- (void)removedTransfer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_SFAirDropTransferObserver *)self updatedTransfer:v4];
  v5 = [(_SFAirDropTransferObserver *)self transferIdentifierToTransfer];
  objc_super v6 = [v4 identifier];

  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    int v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v7 identifier];
      int v14 = 138412290;
      long long v15 = v9;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Removed transfer %@", (uint8_t *)&v14, 0xCu);
    }
    [(_SFAirDropTransferObserver *)self removeObserverForLocalOnlyPropertiesOnTransfer:v7];
    uint64_t v10 = [(_SFAirDropTransferObserver *)self transferIdentifierToTransfer];
    uint64_t v11 = [v7 identifier];
    [v10 removeObjectForKey:v11];

    uint64_t v12 = [(_SFAirDropTransferObserver *)self delegate];
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if (v11)
    {
      long long v13 = [(_SFAirDropTransferObserver *)self delegate];
      [v13 removedTransfer:v7];
    }
  }
}

- (id)machServiceName
{
  return @"com.apple.sharing.transfer-observer";
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA0B840];
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA38E40];
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFAirDropTransferObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAirDropTransferObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)transferIdentifierToTransfer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifierToTransfer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifierToTransfer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end