@interface SYShowBacklinkIndicatorCommandSynapseImpl
- (BOOL)didSucceed;
- (BOOL)isActive;
- (SYBacklinkIndicatorClient)_client;
- (SYShowBacklinkIndicatorCommandSynapseImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4;
- (void)invalidate;
- (void)runWithCompletion:(id)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)set_client:(id)a3;
@end

@implementation SYShowBacklinkIndicatorCommandSynapseImpl

- (SYShowBacklinkIndicatorCommandSynapseImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYShowBacklinkIndicatorCommandSynapseImpl;
  v8 = [(SYShowBacklinkIndicatorCommandSynapseImpl *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[SYBacklinkIndicatorClient clientWithDomainIdentifiers:v6 linkIdentifiers:v7];
    client = v8->__client;
    v8->__client = (SYBacklinkIndicatorClient *)v9;
  }
  return v8;
}

- (BOOL)isActive
{
  v3 = [(SYShowBacklinkIndicatorCommandSynapseImpl *)self _client];
  if (v3) {
    BOOL v4 = [(SYShowBacklinkIndicatorCommandSynapseImpl *)self didSucceed];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SYShowBacklinkIndicatorCommandSynapseImpl *)self _client];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SYShowBacklinkIndicatorCommandSynapseImpl_runWithCompletion___block_invoke;
  v7[3] = &unk_1E64638C0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 requestIndicatorWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__SYShowBacklinkIndicatorCommandSynapseImpl_runWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "Request to show backlink indicator failed.", v7, 2u);
    }
  }
  [WeakRetained setDidSucceed:a2];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)invalidate
{
}

- (SYBacklinkIndicatorClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (void).cxx_destruct
{
}

@end