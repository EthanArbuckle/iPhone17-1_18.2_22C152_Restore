@interface SBSHomeScreenConfigurationServiceProxy
- (id)_makeErrorWithCode:(void *)a1;
- (id)_makeSessionNotActiveError;
- (id)initWithInvalidationHandler:(id *)a1;
- (id)makeConnection;
- (void)applyConfiguration:(id)a3 completion:(id)a4;
- (void)beginConfigurationSessionWithCompletion:(id)a3;
- (void)connectionDidInvalidate;
- (void)endConfigurationSessionWithCompletion:(id)a3;
- (void)setInvalidationHandler:(void *)a1;
@end

@implementation SBSHomeScreenConfigurationServiceProxy

- (id)initWithInvalidationHandler:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBSHomeScreenConfigurationServiceProxy;
    a1 = (id *)[super init];
    if (a1)
    {
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.springboard.home-screen-configuration.connectionQueue", v4);
      id v6 = a1[1];
      a1[1] = v5;

      uint64_t v7 = MEMORY[0x192FC0DF0](v3);
      id v8 = a1[2];
      a1[2] = (id)v7;

      uint64_t v9 = -[SBSHomeScreenConfigurationServiceProxy makeConnection](a1);
      id v10 = a1[3];
      a1[3] = (id)v9;

      [a1[3] activate];
    }
  }

  return a1;
}

- (id)makeConnection
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    id v3 = +[SBSHomeScreenConfigurationServiceInterfaceSpecification identifier];
    v4 = [MEMORY[0x1E4F50BB8] endpointForMachName:v2 service:v3 instance:0];
    dispatch_queue_t v5 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v4];
    objc_initWeak(&location, a1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke;
    v7[3] = &unk_1E566B438;
    v7[4] = a1;
    objc_copyWeak(&v8, &location);
    [v5 configureConnection:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    dispatch_queue_t v5 = 0;
  }
  return v5;
}

- (void)beginConfigurationSessionWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0;
  }
  dispatch_queue_t v5 = [(BSServiceConnection *)connection remoteTarget];
  id v6 = v5;
  if (v5)
  {
    [v5 beginConfigurationSessionWithCompletion:v8];
  }
  else
  {
    uint64_t v7 = -[SBSHomeScreenConfigurationServiceProxy _makeSessionNotActiveError](self);
    v8[2](v8, v7);
  }
}

- (id)_makeSessionNotActiveError
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:SBSHomeScreenConfigurationErrorDomain code:1 userInfo:0];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)applyConfiguration:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0;
  }
  id v8 = [(BSServiceConnection *)connection remoteTarget];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 applyConfiguration:v11 completion:v6];
  }
  else
  {
    id v10 = -[SBSHomeScreenConfigurationServiceProxy _makeSessionNotActiveError](self);
    v6[2](v6, v10);
  }
}

- (void)endConfigurationSessionWithCompletion:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v4, 0, 16);
    connection = self->_connection;
  }
  else
  {
    connection = 0;
  }
  uint64_t v7 = [(BSServiceConnection *)connection remoteTarget];
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__SBSHomeScreenConfigurationServiceProxy_endConfigurationSessionWithCompletion___block_invoke;
    v9[3] = &unk_1E566B930;
    v9[4] = self;
    id v10 = v5;
    [v7 endConfigurationSessionWithCompletion:v9];
  }
  else
  {
    [(BSServiceConnection *)self->_connection invalidate];
    id v8 = -[SBSHomeScreenConfigurationServiceProxy _makeSessionNotActiveError](self);
    (*((void (**)(id, void *))v5 + 2))(v5, v8);
  }
}

- (void)setInvalidationHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

void __80__SBSHomeScreenConfigurationServiceProxy_endConfigurationSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectionDidInvalidate
{
  if (a1)
  {
    id v4 = a1[2];
    objc_setProperty_nonatomic_copy(a1, v2, 0, 16);
    id v3 = v4;
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
      id v3 = v4;
    }
  }
}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSHomeScreenConfigurationServiceInterfaceSpecification interface];
  [v3 setInterface:v4];

  id v5 = +[SBSHomeScreenConfigurationServiceInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  [v3 setTargetQueue:v7];
  [v3 setActivationHandler:&__block_literal_global_42];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_5;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v8];
  objc_destroyWeak(&v9);
}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __56__SBSHomeScreenConfigurationServiceProxy_makeConnection__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v3, v4);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSHomeScreenConfigurationServiceProxy connectionDidInvalidate](WeakRetained);
}

- (id)_makeErrorWithCode:(void *)a1
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:SBSHomeScreenConfigurationErrorDomain code:a2 userInfo:0];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end