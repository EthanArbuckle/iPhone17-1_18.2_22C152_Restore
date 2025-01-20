@interface _SBRemoteAlertHandleServerTarget
+ (_SBRemoteAlertHandleServerTarget)currentTarget;
- (BSServiceConnection)connection;
- (SBSRemoteAlertHandleServiceServerInterface)proxyInterface;
- (_SBRemoteAlertHandleServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4;
- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4;
- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5;
- (void)_performBlock:(id)a3;
- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4;
- (void)invalidateRemoteAlertHandleWithID:(id)a3;
- (void)setProxyInterface:(id)a3;
@end

@implementation _SBRemoteAlertHandleServerTarget

- (_SBRemoteAlertHandleServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SBRemoteAlertHandleServerTarget;
  v8 = [(_SBRemoteAlertHandleServerTarget *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
  }

  return v9;
}

- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__114;
  v25 = __Block_byref_object_dispose__114;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116___SBRemoteAlertHandleServerTarget_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke;
  v16[3] = &unk_1E6B07AE0;
  v20 = &v21;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  [(_SBRemoteAlertHandleServerTarget *)self _performBlock:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__114;
  v20 = __Block_byref_object_dispose__114;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102___SBRemoteAlertHandleServerTarget_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke;
  v12[3] = &unk_1E6AFDBE0;
  v15 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(_SBRemoteAlertHandleServerTarget *)self _performBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86___SBRemoteAlertHandleServerTarget_activateRemoteAlertHandleWithID_activationContext___block_invoke;
  v10[3] = &unk_1E6AF4E00;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_SBRemoteAlertHandleServerTarget *)self _performBlock:v10];
}

- (void)invalidateRemoteAlertHandleWithID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70___SBRemoteAlertHandleServerTarget_invalidateRemoteAlertHandleWithID___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_SBRemoteAlertHandleServerTarget *)self _performBlock:v6];
}

+ (_SBRemoteAlertHandleServerTarget)currentTarget
{
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_378);
  }
  pthread_key_t v2 = _SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey;
  return (_SBRemoteAlertHandleServerTarget *)pthread_getspecific(v2);
}

- (void)_performBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_378);
  }
  pthread_setspecific(_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1) {
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_378);
  }
  pthread_setspecific(_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey, 0);
}

- (BSServiceConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (BSServiceConnection *)WeakRetained;
}

- (SBSRemoteAlertHandleServiceServerInterface)proxyInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyInterface);
  return (SBSRemoteAlertHandleServiceServerInterface *)WeakRetained;
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