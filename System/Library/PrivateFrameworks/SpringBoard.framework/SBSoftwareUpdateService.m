@interface SBSoftwareUpdateService
+ (id)sharedInstance;
- (id)_init;
- (void)systemServiceServer:(id)a3 client:(id)a4 passcodePolicy:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setPasscodePolicy:(int64_t)a5;
@end

@implementation SBSoftwareUpdateService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_118);
  }
  v2 = (void *)sharedInstance___sharedInstance_9;
  return v2;
}

void __41__SBSoftwareUpdateService_sharedInstance__block_invoke()
{
  id v0 = [[SBSoftwareUpdateService alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_9;
  sharedInstance___sharedInstance_9 = (uint64_t)v0;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSoftwareUpdateService;
  v2 = [(SBSoftwareUpdateService *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v4 = [v3 initWithEntitlement:*MEMORY[0x1E4FA7188]];
    serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = v2->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
    v2->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    v6 = +[SBSystemServiceServer sharedInstance];
    [v6 setSoftwareUpdateDelegate:v2];
  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 passcodePolicy:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = self->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  id v14 = 0;
  int v10 = [(FBServiceClientAuthenticator *)serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator authenticateClient:v7 error:&v14];
  id v11 = v14;
  if (v10)
  {
    id v13 = v8;
    BSDispatchMain();
  }
  else
  {
    v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBSoftwareUpdateService systemServiceServer:client:passcodePolicy:](v7);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __69__SBSoftwareUpdateService_systemServiceServer_client_passcodePolicy___block_invoke(uint64_t a1)
{
  v2 = [(id)SBApp softwareUpdatePasscodePolicyManager];
  [v2 softwareUpdatePasscodePolicy];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setPasscodePolicy:(int64_t)a5
{
  id v6 = a4;
  serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator = self->_serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator;
  id v11 = 0;
  int v8 = [(FBServiceClientAuthenticator *)serviceClientSoftwareUpdatePasscodePolicyEntitlementAuthenticator authenticateClient:v6 error:&v11];
  id v9 = v11;
  if (v8)
  {
    BSDispatchMain();
  }
  else
  {
    int v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBSoftwareUpdateService systemServiceServer:client:setPasscodePolicy:](v6);
    }
  }
}

void __72__SBSoftwareUpdateService_systemServiceServer_client_setPasscodePolicy___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) <= 2uLL)
  {
    id v2 = [(id)SBApp softwareUpdatePasscodePolicyManager];
    [v2 setSoftwareUpdatePasscodePolicy:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
}

- (void)systemServiceServer:(void *)a1 client:passcodePolicy:.cold.1(void *a1)
{
  [a1 pid];
  v1 = BSProcessDescriptionForPID();
  id v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_12(&dword_1D85BA000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemServiceServer:(void *)a1 client:setPasscodePolicy:.cold.1(void *a1)
{
  [a1 pid];
  v1 = BSProcessDescriptionForPID();
  id v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_12(&dword_1D85BA000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

@end