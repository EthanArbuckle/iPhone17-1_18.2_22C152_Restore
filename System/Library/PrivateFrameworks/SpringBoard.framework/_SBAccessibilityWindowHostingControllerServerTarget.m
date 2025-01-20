@interface _SBAccessibilityWindowHostingControllerServerTarget
+ (_SBAccessibilityWindowHostingControllerServerTarget)currentTarget;
- (BSServiceConnection)connection;
- (SBSAccessibilityWindowHostingClientToServerInterface)proxyInterface;
- (_SBAccessibilityWindowHostingControllerServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4;
- (void)_performBlock:(id)a3;
- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4;
- (void)setProxyInterface:(id)a3;
- (void)unregisterWindowWithContextID:(id)a3;
@end

@implementation _SBAccessibilityWindowHostingControllerServerTarget

- (_SBAccessibilityWindowHostingControllerServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SBAccessibilityWindowHostingControllerServerTarget;
  v8 = [(_SBAccessibilityWindowHostingControllerServerTarget *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
  }

  return v9;
}

- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91___SBAccessibilityWindowHostingControllerServerTarget_registerWindowWithContextID_atLevel___block_invoke;
  v10[3] = &unk_1E6AF4E00;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_SBAccessibilityWindowHostingControllerServerTarget *)self _performBlock:v10];
}

- (void)unregisterWindowWithContextID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85___SBAccessibilityWindowHostingControllerServerTarget_unregisterWindowWithContextID___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_SBAccessibilityWindowHostingControllerServerTarget *)self _performBlock:v6];
}

+ (_SBAccessibilityWindowHostingControllerServerTarget)currentTarget
{
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_100);
  }
  pthread_key_t v2 = _SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey;
  return (_SBAccessibilityWindowHostingControllerServerTarget *)pthread_getspecific(v2);
}

- (void)_performBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_100);
  }
  pthread_setspecific(_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_100);
  }
  pthread_setspecific(_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey, 0);
}

- (BSServiceConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (BSServiceConnection *)WeakRetained;
}

- (SBSAccessibilityWindowHostingClientToServerInterface)proxyInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyInterface);
  return (SBSAccessibilityWindowHostingClientToServerInterface *)WeakRetained;
}

- (void)setProxyInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyInterface);
  objc_destroyWeak((id *)&self->_connection);
}

@end