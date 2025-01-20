@interface _SBInCallPresentationRequestServerTarget
+ (_SBInCallPresentationRequestServerTarget)currentTarget;
- (BSServiceConnection)connection;
- (NSUUID)clientIdentifier;
- (SBSInCallPresentationClientToServerInterface)proxyInterface;
- (_SBInCallPresentationRequestServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4;
- (void)_performBlock:(id)a3;
- (void)presentWithConfiguration:(id)a3 completion:(id)a4;
- (void)setProxyInterface:(id)a3;
@end

@implementation _SBInCallPresentationRequestServerTarget

- (_SBInCallPresentationRequestServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBInCallPresentationRequestServerTarget;
  v8 = [(_SBInCallPresentationRequestServerTarget *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSUUID *)v10;
  }
  return v9;
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80___SBInCallPresentationRequestServerTarget_presentWithConfiguration_completion___block_invoke;
  v10[3] = &unk_1E6AF5FC8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_SBInCallPresentationRequestServerTarget *)self _performBlock:v10];
}

+ (_SBInCallPresentationRequestServerTarget)currentTarget
{
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  }
  pthread_key_t v2 = _SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey;
  return (_SBInCallPresentationRequestServerTarget *)pthread_getspecific(v2);
}

- (void)_performBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  }
  pthread_setspecific(_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  }
  pthread_setspecific(_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey, 0);
}

- (BSServiceConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (BSServiceConnection *)WeakRetained;
}

- (SBSInCallPresentationClientToServerInterface)proxyInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyInterface);
  return (SBSInCallPresentationClientToServerInterface *)WeakRetained;
}

- (void)setProxyInterface:(id)a3
{
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_proxyInterface);
  objc_destroyWeak((id *)&self->_connection);
}

@end