@interface IOUIAngelService
+ (id)interface;
- (BOOL)isIntrusiveUIDisplayed;
- (BOOL)isServerRunning;
- (IOUIAngelService)init;
- (IOUIAngelService)initWithIdentifier:(id)a3;
- (IOUIAngelServiceDelegate)delegate;
- (void)activate;
- (void)invalidate;
- (void)pingServerWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIntrusiveUI:(BOOL)a3 completion:(id)a4;
- (void)setIsIntrusiveUIDisplayed:(BOOL)a3;
@end

@implementation IOUIAngelService

+ (id)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)interface___interface;

  return v2;
}

void __29__IOUIAngelService_interface__block_invoke(id a1)
{
  id v4 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.IOUIAngel.LDCM-service"];
  v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___IOUIAngelServiceServerInterface];
  [v4 setServer:v1];

  [v4 setClientMessagingExpectation:0];
  id v2 = [v4 copy];
  v3 = (void *)interface___interface;
  interface___interface = (uint64_t)v2;
}

- (IOUIAngelService)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IOUIAngelService initWithIdentifier:]";
    __int16 v19 = 1024;
    int v20 = 46;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Setting up IOUIAngelService and establishing connection to IOUIAngelServer", buf, 0x12u);
  }
  v16.receiver = self;
  v16.super_class = (Class)IOUIAngelService;
  v5 = [(IOUIAngelService *)&v16 init];
  v6 = v5;
  if (v5)
  {
    criticalUIAssertion = v5->_criticalUIAssertion;
    v5->_criticalUIAssertion = 0;

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[BSServiceConnectionEndpoint endpointForMachName:@"com.apple.IOUIAngel.LDCM" service:@"com.apple.IOUIAngel.LDCM-service" instance:0];
    endpoint = v6->_endpoint;
    v6->_endpoint = (BSServiceConnectionEndpoint *)v8;

    if (v6->_endpoint)
    {
      uint64_t v10 = +[BSServiceConnection connectionWithEndpoint:](BSServiceConnection, "connectionWithEndpoint:");
      server = v6->_server;
      v6->_server = (BSServiceConnectionClient *)v10;

      v12 = v6->_server;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __39__IOUIAngelService_initWithIdentifier___block_invoke;
      v14[3] = &unk_51388;
      v15 = v6;
      [(BSServiceConnectionClient *)v12 configureConnection:v14];
      [(BSServiceConnectionClient *)v6->_server activate];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      -[IOUIAngelService initWithIdentifier:]();
    }
  }

  return v6;
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[IOUIAngelService interface];
  [v3 setInterface:v4];

  v5 = +[BSServiceQuality userInteractive];
  [v3 setServiceQuality:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __39__IOUIAngelService_initWithIdentifier___block_invoke_2;
  v10[3] = &unk_51360;
  id v11 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __39__IOUIAngelService_initWithIdentifier___block_invoke_3;
  v8[3] = &unk_51360;
  id v9 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__IOUIAngelService_initWithIdentifier___block_invoke_57;
  v6[3] = &unk_51360;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = [v4 remoteTarget];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32) status:0];
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    __39__IOUIAngelService_initWithIdentifier___block_invoke_3_cold_1();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32) status:2];

  [v3 activate];
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke_57(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    __39__IOUIAngelService_initWithIdentifier___block_invoke_57_cold_1();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32) status:1];
}

- (IOUIAngelService)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[IOUIAngelService init]";
    __int16 v6 = 1024;
    int v7 = 107;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Empty init (Should not be getting called)", (uint8_t *)&v4, 0x12u);
  }
  return [(IOUIAngelService *)self initWithIdentifier:0];
}

- (void)activate
{
}

- (void)invalidate
{
  [(BSServiceConnectionClient *)self->_server invalidate];
  os_unfair_lock_lock(&self->_lock);
  activeProxy = self->_activeProxy;
  self->_activeProxy = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isServerRunning
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_activeProxy != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsIntrusiveUIDisplayed:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isIntrusiveUIDisplayed = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)pingServerWithCompletion:(id)a3
{
  id v4 = a3;
  server = self->_server;
  __int16 v6 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  objc_super v16 = v6;
  int v7 = +[NSArray arrayWithObjects:&v16 count:1];
  uint64_t v8 = [(BSServiceConnectionClient *)server remoteTargetWithLaunchingAssertionAttributes:v7];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[IOUIAngelService pingServerWithCompletion:]";
    __int16 v14 = 1024;
    int v15 = 144;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Sending ping", buf, 0x12u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__IOUIAngelService_pingServerWithCompletion___block_invoke;
  v10[3] = &unk_513B0;
  id v11 = v4;
  id v9 = v4;
  [v8 pingWithCompletion:v10];
}

void __45__IOUIAngelService_pingServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __45__IOUIAngelService_pingServerWithCompletion___block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[IOUIAngelService pingServerWithCompletion:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 155;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Recieved ping back", (uint8_t *)&v6, 0x12u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)setIntrusiveUI:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  server = self->_server;
  __int16 v8 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v46 = v8;
  int v9 = +[NSArray arrayWithObjects:&v46 count:1];
  uint64_t v10 = [(BSServiceConnectionClient *)server remoteTargetWithLaunchingAssertionAttributes:v9];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"remove";
    v41 = "-[IOUIAngelService setIntrusiveUI:completion:]";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      id v11 = @"display";
    }
    __int16 v42 = 1024;
    int v43 = 166;
    __int16 v44 = 2112;
    v45 = v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Sending message to %@ intrusive UI", buf, 0x1Cu);
  }
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  v34 = __46__IOUIAngelService_setIntrusiveUI_completion___block_invoke;
  v35 = &unk_513D8;
  BOOL v38 = v4;
  id v12 = v6;
  v36 = self;
  id v37 = v12;
  v13 = objc_retainBlock(&v32);
  if (v4)
  {
    objc_msgSend(v10, "setIntrusiveUIWithCompletion:", v13, v32, v33, v34, v35);
    __int16 v14 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.IOUIAngel" name:@"criticalUI"];
    if (v14)
    {
      int v15 = +[RBSProcessPredicate predicateMatchingServiceName:@"com.apple.IOUIAngel.LDCM-service"];
      if (v15)
      {
        objc_super v16 = +[RBSProcessHandle handleForPredicate:v15 error:0];
        v17 = v16;
        if (v16)
        {
          v18 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v16 pid]);
          if (v18)
          {
            id v19 = objc_alloc((Class)RBSAssertion);
            v39 = v14;
            int v20 = +[NSArray arrayWithObjects:&v39 count:1];
            id v21 = [v19 initWithExplanation:@"Critical UI Presented" target:v18 attributes:v20];

            if (v21)
            {
              v22 = -[_IOUIAngelServiceAssertions initWithRBSAssertion:forPid:]([_IOUIAngelServiceAssertions alloc], "initWithRBSAssertion:forPid:", v21, [v17 pid]);
              criticalUIAssertion = self->_criticalUIAssertion;
              self->_criticalUIAssertion = v22;
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              -[IOUIAngelService setIntrusiveUI:completion:].cold.4();
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            -[IOUIAngelService setIntrusiveUI:completion:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          -[IOUIAngelService setIntrusiveUI:completion:]();
        }
      }
      else
      {
        BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v24) {
          -[IOUIAngelService setIntrusiveUI:completion:](v24, v25, v26, v27, v28, v29, v30, v31);
        }
      }
    }
  }
  else
  {
    objc_msgSend(v10, "removeIntrusiveUIWithCompletion:", v13, v32, v33, v34, v35);
    if ([(_IOUIAngelServiceAssertions *)self->_criticalUIAssertion isValid]) {
      [(_IOUIAngelServiceAssertions *)self->_criticalUIAssertion invalidateWithError:0];
    }
  }
}

void __46__IOUIAngelService_setIntrusiveUI_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __46__IOUIAngelService_setIntrusiveUI_completion___block_invoke_cold_1(a1, (uint64_t)v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"enabled";
    int v5 = *(unsigned __int8 *)(a1 + 48);
    *(void *)&void v6[4] = "-[IOUIAngelService setIntrusiveUI:completion:]_block_invoke";
    *(_DWORD *)id v6 = 136315650;
    if (!v5) {
      BOOL v4 = @"disabled";
    }
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 175;
    __int16 v7 = 2112;
    __int16 v8 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s:%d: Successfully %@ intrusiveUI", v6, 0x1Cu);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsIntrusiveUIDisplayed:", *(unsigned __int8 *)(a1 + 48), *(_OWORD *)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (IOUIAngelServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IOUIAngelServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isIntrusiveUIDisplayed
{
  return self->_isIntrusiveUIDisplayed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_criticalUIAssertion, 0);
  objc_storeStrong((id *)&self->_activeProxy, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)initWithIdentifier:.cold.1()
{
  *(_DWORD *)v0 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v0[7] = 98;
  v0[9] = 2112;
  v1 = @"com.apple.IOUIAngel.LDCM";
  __int16 v2 = 2112;
  id v3 = @"IOUIAngelLDCM";
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:%d: Failed to lookup endpoint with machName=%@ service=%@", (uint8_t *)v0, 0x26u);
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke_3_cold_1()
{
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 71;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:%d: Connection to IOUIAngelServer has been interrupted", (uint8_t *)v0, 0x12u);
}

void __39__IOUIAngelService_initWithIdentifier___block_invoke_57_cold_1()
{
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 84;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:%d: Connection to IOUIAngelServer has been invalidated", (uint8_t *)v0, 0x12u);
}

void __45__IOUIAngelService_pingServerWithCompletion___block_invoke_cold_1()
{
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 148;
  v1[9] = 2112;
  uint64_t v2 = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:%d: Ping error = %@", (uint8_t *)v1, 0x1Cu);
}

- (void)setIntrusiveUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIntrusiveUI:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_0, &_os_log_default, v0, "Failed to get process handle for predicate %@", v1, v2, v3, v4, v5);
}

- (void)setIntrusiveUI:completion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_0, &_os_log_default, v0, "Failed to get target for process handle %@", v1, v2, v3, v4, v5);
}

- (void)setIntrusiveUI:completion:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_0, &_os_log_default, v0, "Failed to create assertion for target %@", v1, v2, v3, v4, v5);
}

void __46__IOUIAngelService_setIntrusiveUI_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint8_t v5 = "-[IOUIAngelService setIntrusiveUI:completion:]_block_invoke";
  __int16 v6 = 1024;
  int v4 = 136315906;
  int v7 = 171;
  if (v2) {
    uint64_t v3 = @"enable";
  }
  else {
    uint64_t v3 = @"disable";
  }
  __int16 v8 = 2112;
  int v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:%d: Failed to %@ intrusiveUI with error = %@", (uint8_t *)&v4, 0x26u);
}

@end