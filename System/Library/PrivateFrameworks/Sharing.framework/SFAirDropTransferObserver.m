@interface SFAirDropTransferObserver
- (BOOL)isModern;
- (SFAirDropTransferObserver)init;
- (SFAirDropTransferObserverDelegate)delegate;
- (_SFAirDropTransferObserver)legacyObserver;
- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)modernObserver;
- (void)activate;
- (void)invalidate;
- (void)removedTransfer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsModern:(BOOL)a3;
- (void)setLegacyObserver:(id)a3;
- (void)setModernObserver:(id)a3;
- (void)updatedTransfer:(id)a3;
@end

@implementation SFAirDropTransferObserver

uint64_t __77___SFAirDropTransferObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatedTransfer:*(void *)(a1 + 40)];
}

void __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) transferIdentifierToTransfer];
  v5 = [v3 transferIdentifier];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_2;
    v9[3] = &unk_1E5BBBD40;
    v10 = v6;
    id v11 = v3;
    [v7 _getRemoteObjectProxyOnQueue:v9];

    v8 = v10;
  }
  else
  {
    v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_cold_1((uint64_t)v3, a1, v8);
    }
  }
}

uint64_t __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 transfer:*(void *)(a1 + 32) actionTriggeredForAction:*(void *)(a1 + 40)];
}

- (SFAirDropTransferObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFAirDropTransferObserver;
  v2 = [(SFAirDropTransferObserver *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_isModern = 0;
    v4 = objc_alloc_init(_SFAirDropTransferObserver);
    legacyObserver = v3->_legacyObserver;
    v3->_legacyObserver = v4;

    [(_SFAirDropTransferObserver *)v3->_legacyObserver setDelegate:v3];
  }
  return v3;
}

- (void)activate
{
  if ([(SFAirDropTransferObserver *)self isModern]) {
    [(SFAirDropTransferObserver *)self modernObserver];
  }
  else {
  id v3 = [(SFAirDropTransferObserver *)self legacyObserver];
  }
  [v3 activate];
}

- (void)invalidate
{
  if ([(SFAirDropTransferObserver *)self isModern]) {
    [(SFAirDropTransferObserver *)self modernObserver];
  }
  else {
  id v3 = [(SFAirDropTransferObserver *)self legacyObserver];
  }
  [v3 activate];
}

- (void)updatedTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [(SFAirDropTransferObserver *)self delegate];
  [v5 updatedTransfer:v4];
}

- (void)removedTransfer:(id)a3
{
  id v7 = a3;
  id v4 = [(SFAirDropTransferObserver *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SFAirDropTransferObserver *)self delegate];
    [v6 removedTransfer:v7];
  }
}

- (SFAirDropTransferObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAirDropTransferObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFAirDropTransferObserver)legacyObserver
{
  return self->_legacyObserver;
}

- (void)setLegacyObserver:(id)a3
{
}

- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)modernObserver
{
  return self->_modernObserver;
}

- (void)setModernObserver:(id)a3
{
}

- (BOOL)isModern
{
  return self->_isModern;
}

- (void)setIsModern:(BOOL)a3
{
  self->_isModern = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernObserver, 0);
  objc_storeStrong((id *)&self->_legacyObserver, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 40));
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = WeakRetained;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "Unable to trigger action %@ for unknown transfer: %@", (uint8_t *)&v6, 0x16u);
}

@end