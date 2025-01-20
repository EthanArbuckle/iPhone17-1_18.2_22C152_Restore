@interface SiriActivationAssertion
- (SiriActivationAssertion)initWithIdentifier:(id)a3 reason:(unint64_t)a4;
- (id)connection;
- (unint64_t)reason;
- (void)_setConnection:(id)a3;
- (void)configureConnection;
- (void)dealloc;
- (void)invalidate;
- (void)invalidatedAtTimestamp:(double)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation SiriActivationAssertion

- (SiriActivationAssertion)initWithIdentifier:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriActivationAssertion;
  v7 = [(SiriActivationSource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SiriActivationSource *)v7 setIdentifier:v6];
    [(SiriActivationAssertion *)v8 setReason:a4];
    [(SiriActivationAssertion *)v8 configureConnection];
  }

  return v8;
}

- (void)configureConnection
{
  v3 = (void *)MEMORY[0x1E4F50BB8];
  v4 = +[SASBoardServicesConfiguration configuration];
  v5 = [v4 machServiceIdentifier];
  id v6 = +[SASBoardServicesConfiguration configuration];
  v7 = [v6 identifierForService:1];
  v8 = [v3 endpointForMachName:v5 service:v7 instance:0];

  v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
  connection = self->super._connection;
  self->super._connection = v9;

  objc_initWeak(&location, self);
  v11 = self->super._connection;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __46__SiriActivationAssertion_configureConnection__block_invoke;
  v15 = &unk_1E6B67588;
  objc_copyWeak(&v16, &location);
  [(BSServiceConnection *)v11 configureConnection:&v12];
  [(BSServiceConnection *)self->super._connection activate];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __46__SiriActivationAssertion_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy_;
    v15[4] = __Block_byref_object_dispose_;
    id v16 = [WeakRetained identifier];
    v7 = +[SASSignalServer serviceQuality];
    [v3 setServiceQuality:v7];

    v8 = +[SASSignalServer interface];
    [v3 setInterface:v8];

    [v3 setInterfaceTarget:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_22;
    v13[3] = &unk_1E6B67FA8;
    v13[4] = v6;
    objc_copyWeak(&v14, v4);
    [v3 setInvalidationHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_24;
    v11[3] = &unk_1E6B67FA8;
    v11[4] = v6;
    objc_copyWeak(&v12, v4);
    [v3 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_25;
    v9[3] = &unk_1E6B67FD0;
    objc_copyWeak(&v10, v4);
    v9[4] = v6;
    v9[5] = v15;
    [v3 setActivationHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
  }
}

void __46__SiriActivationAssertion_configureConnection__block_invoke_22(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Received Invalidation for Assertion - %@, Invalidating…", (uint8_t *)&v5, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __46__SiriActivationAssertion_configureConnection__block_invoke_24(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Received Interruption for Assertion - %@, Invalidating…", (uint8_t *)&v5, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __46__SiriActivationAssertion_configureConnection__block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v18 = 136315650;
    v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated for assertion strongSelf=%p connection=%@", (uint8_t *)&v18, 0x20u);
  }
  if (WeakRetained)
  {
    os_log_t v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29060];
      id v10 = v8;
      v11 = [v9 currentThread];
      uint64_t v12 = [v11 qualityOfService];
      int v18 = 136315394;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);
    }
    os_unfair_lock_lock(WeakRetained + 4);
    uint64_t v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock successfully locked", (uint8_t *)&v18, 0xCu);
    }
    id v14 = [v3 remoteTarget];
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)&WeakRetained[8]._os_unfair_lock_opaque];
    [v14 registerAssertionWithIdentifier:v15 reason:v16];

    os_unfair_lock_unlock(WeakRetained + 4);
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock unlocked", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)invalidate
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(SiriActivationAssertion *)self invalidatedAtTimestamp:Current];
}

- (void)invalidatedAtTimestamp:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->super._connection;
    int v17 = 136315650;
    int v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    __int16 v19 = 2112;
    __int16 v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = connection;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Unregistering & invalidating assertion self=%@ connection=%@", (uint8_t *)&v17, 0x20u);
  }
  os_log_t v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = (void *)MEMORY[0x1E4F29060];
    uint64_t v9 = v7;
    id v10 = [v8 currentThread];
    uint64_t v11 = [v10 qualityOfService];
    int v17 = 136315394;
    int v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    __int16 v19 = 2048;
    __int16 v20 = (SiriActivationAssertion *)v11;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v17, 0x16u);
  }
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v12 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    int v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v13 = [(BSServiceConnection *)self->super._connection remoteTarget];
  id v14 = [(SiriActivationSource *)self identifier];
  [v13 unregisterAssertionWithIdentifier:v14];

  [(BSServiceConnection *)self->super._connection invalidate];
  uint64_t v15 = self->super._connection;
  self->super._connection = 0;

  os_unfair_lock_unlock(&self->super._lock);
  id v16 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    int v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v17, 0xCu);
  }
}

- (id)connection
{
  return self->super._connection;
}

- (void)_setConnection:(id)a3
{
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SiriActivationAssertion dealloc]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation SiriActivationAssertion got deallocated", buf, 0xCu);
  }
  [(SiriActivationAssertion *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SiriActivationAssertion;
  [(SiriActivationSource *)&v4 dealloc];
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end