@interface MadGate
- (BOOL)deactivateDevice:(id *)a3;
- (BOOL)deleteLegacyDeviceIdentity:(id *)a3;
- (BOOL)handleActivationInfo:(id)a3 withError:(id *)a4;
- (BOOL)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 error:(id *)a5;
- (BOOL)isDeviceABrick:(id *)a3;
- (BOOL)isInFieldCollected:(id *)a3;
- (BOOL)isUCRTAvailable:(id *)a3;
- (BOOL)issueUCRT:(id)a3 withError:(id *)a4;
- (BOOL)reactivateDevice:(id *)a3;
- (BOOL)recertifyDeviceWithError:(id *)a3;
- (BOOL)ucrtUpgradeRequired:(id *)a3;
- (BOOL)unbrickDevice:(id *)a3;
- (MadGate)init;
- (NSXPCConnection)connection;
- (__SecIdentity)copyLegacyDeviceIdentity:(id *)a3;
- (id)copyActivationRecord:(id *)a3;
- (id)copyDCRT:(id)a3 withError:(id *)a4;
- (id)copyPCRTToken:(id *)a3;
- (id)copyUCRTVersionInfo:(id *)a3;
- (id)createActivationInfo:(id *)a3;
- (id)createTunnel1ActivationInfo:(id)a3 options:(id)a4 error:(id *)a5;
- (id)createTunnel1SessionInfo:(id *)a3;
- (id)getActivationBuild:(id *)a3;
- (id)getActivationState:(id *)a3;
- (id)getDCRTState:(id)a3 withError:(id *)a4;
- (id)getUCRTActivationLockState:(id *)a3;
- (id)issueClientCertificateLegacy:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)issueCollection:(id)a3 withCompletion:(id)a4;
- (void)issueDCRT:(id)a3 withCompletion:(id)a4;
- (void)updateBasebandTicket:(__SecKey *)a3 baaCert:(__SecCertificate *)a4 baaIntermediateCert:(__SecCertificate *)a5 options:(id)a6 withCompletion:(id)a7;
@end

@implementation MadGate

- (void).cxx_destruct
{
}

void __30__MadGate_getActivationState___block_invoke_92(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"ActivationState"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"ActivationState"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (MadGate)init
{
  v7.receiver = self;
  v7.super_class = (Class)MadGate;
  v2 = [(MadGate *)&v7 init];
  if (v2)
  {
    id v3 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38E1C90];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v3];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (id)getActivationState:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_getActivationState___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __30__MadGate_getActivationState___block_invoke_92;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 getActivationStateWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_super v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    objc_super v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (void)dealloc
{
  id v3 = [(MadGate *)self connection];
  [(NSXPCConnection *)v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MadGate;
  [(MadGate *)&v4 dealloc];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)getUCRTActivationLockState:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = createMobileActivationError((uint64_t)"-[MadGate getUCRTActivationLockState:]", 59, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"SPI not supported on iOS.");
  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (a3) {
    *a3 = v4;
  }

  return 0;
}

void __30__MadGate_getActivationState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate getActivationState:]_block_invoke", 91, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)getActivationBuild:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_getActivationBuild___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __30__MadGate_getActivationBuild___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 getActivationBuildWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  id v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    id v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __30__MadGate_getActivationBuild___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate getActivationBuild:]_block_invoke", 122, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_getActivationBuild___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"LastActivated"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"LastActivated"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (BOOL)isUCRTAvailable:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __27__MadGate_isUCRTAvailable___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __27__MadGate_isUCRTAvailable___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 copyUCRTWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  int v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = (id) v13[5];
    int v7 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __27__MadGate_isUCRTAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate isUCRTAvailable:]_block_invoke", 154, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __27__MadGate_isUCRTAvailable___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = (id)[a2 objectForKeyedSubscript:@"UCRTData"];
  id v7 = isNSData(v6);

  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)copyPCRTToken:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __25__MadGate_copyPCRTToken___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __25__MadGate_copyPCRTToken___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 copyPCRTTokenWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  id v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    id v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __25__MadGate_copyPCRTToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate copyPCRTToken:]_block_invoke", 186, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __25__MadGate_copyPCRTToken___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"PCRTToken"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"PCRTToken"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (BOOL)isDeviceABrick:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __26__MadGate_isDeviceABrick___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __26__MadGate_isDeviceABrick___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 isDeviceBrickedWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  int v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && *((unsigned char *)v19 + 24))
  {
    *a3 = (id) v13[5];
    int v7 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __26__MadGate_isDeviceABrick___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate isDeviceABrick:]_block_invoke", 219, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __26__MadGate_isDeviceABrick___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"BrickState"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"BrickState"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (id)createTunnel1SessionInfo:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 createTunnel1SessionInfoWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  id v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    id v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __36__MadGate_createTunnel1SessionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate createTunnel1SessionInfo:]_block_invoke", 251, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_createTunnel1SessionInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)createTunnel1ActivationInfo:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v10 = [(MadGate *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3254779904;
  v17[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke;
  v17[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v17[4] = &v18;
  id v11 = [(NSXPCConnection *)v10 synchronousRemoteObjectProxyWithErrorHandler:v17];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2;
  v16[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v16[4] = &v24;
  v16[5] = &v18;
  [v11 createTunnel1ActivationInfo:v8 options:v9 withCompletionBlock:v16];
  if (v19[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v19[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v12;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v13 = (void *)v25[5];
  if (a5 && !v13)
  {
    *a5 = (id) v19[5];
    uint64_t v13 = (void *)v25[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate createTunnel1ActivationInfo:options:error:]_block_invoke", 280, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)createActivationInfo:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __32__MadGate_createActivationInfo___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __32__MadGate_createActivationInfo___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  v10[5] = &v12;
  [v5 createActivationInfoWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    uint64_t v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __32__MadGate_createActivationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate createActivationInfo:]_block_invoke", 309, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MadGate_createActivationInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)handleActivationInfo:(id)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v7 = [(MadGate *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3254779904;
  v13[2] = __42__MadGate_handleActivationInfo_withError___block_invoke;
  v13[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  id v8 = [(NSXPCConnection *)v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __42__MadGate_handleActivationInfo_withError___block_invoke_2;
  v12[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v12[4] = &v14;
  [v8 handleActivationInfo:v6 withCompletionBlock:v12];
  uint64_t v9 = v15[5];
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v15[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a4) {
      *a4 = (id) v15[5];
    }
  }

  _Block_object_dispose(&v14, 8);
  return v9 == 0;
}

void __42__MadGate_handleActivationInfo_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate handleActivationInfo:withError:]_block_invoke", 338, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __42__MadGate_handleActivationInfo_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v10 = [(MadGate *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke;
  v16[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v16[4] = &v17;
  id v11 = [(NSXPCConnection *)v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2;
  v15[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v15[4] = &v17;
  [v11 handleActivationInfoWithSession:v8 activationSignature:v9 completionBlock:v15];
  uint64_t v12 = v18[5];
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v18[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a5) {
      *a5 = (id) v18[5];
    }
  }

  _Block_object_dispose(&v17, 8);
  return v12 == 0;
}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate handleActivationInfoWithSession:activationSignature:error:]_block_invoke", 368, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)deactivateDevice:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __28__MadGate_deactivateDevice___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __28__MadGate_deactivateDevice___block_invoke_2;
  v9[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v9[4] = &v11;
  [v5 deactivateDeviceWithCompletionBlock:v9];
  uint64_t v6 = v12[5];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

void __28__MadGate_deactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate deactivateDevice:]_block_invoke", 398, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __28__MadGate_deactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)reactivateDevice:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __28__MadGate_reactivateDevice___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __28__MadGate_reactivateDevice___block_invoke_2;
  v9[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v9[4] = &v11;
  [v5 requestDeviceReactivationWithCompletionBlock:v9];
  uint64_t v6 = v12[5];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

void __28__MadGate_reactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate reactivateDevice:]_block_invoke", 428, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __28__MadGate_reactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)copyActivationRecord:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __32__MadGate_copyActivationRecord___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __32__MadGate_copyActivationRecord___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  void v10[5] = &v12;
  [v5 copyActivationRecordWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    uint64_t v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __32__MadGate_copyActivationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate copyActivationRecord:]_block_invoke", 458, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MadGate_copyActivationRecord___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)unbrickDevice:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __25__MadGate_unbrickDevice___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __25__MadGate_unbrickDevice___block_invoke_2;
  v9[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v9[4] = &v11;
  [v5 unbrickDeviceWithCompletionBlock:v9];
  uint64_t v6 = v12[5];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

void __25__MadGate_unbrickDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate unbrickDevice:]_block_invoke", 487, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __25__MadGate_unbrickDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)recertifyDeviceWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __36__MadGate_recertifyDeviceWithError___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __36__MadGate_recertifyDeviceWithError___block_invoke_2;
  v9[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v9[4] = &v11;
  [v5 recertifyDeviceWithCompletionBlock:v9];
  uint64_t v6 = v12[5];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

void __36__MadGate_recertifyDeviceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate recertifyDeviceWithError:]_block_invoke", 517, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_recertifyDeviceWithError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)issueClientCertificateLegacy:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = [(MadGate *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  v14[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  id v8 = [(NSXPCConnection *)v7 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3254779904;
  v13[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2;
  v13[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v21;
  void v13[5] = &v15;
  [v8 issueClientCertificateLegacy:v6 WithCompletionBlock:v13];
  if (v16[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v10 = (void *)v22[5];
  if (a4 && !v10)
  {
    *a4 = (id) v16[5];
    uint64_t v10 = (void *)v22[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate issueClientCertificateLegacy:error:]_block_invoke", 547, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = (id)[a2 objectForKeyedSubscript:@"RKCertification"];
  id v7 = isNSData(v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)isInFieldCollected:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_isInFieldCollected___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __30__MadGate_isInFieldCollected___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  void v10[5] = &v12;
  [v5 isInFieldCollectedWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  int v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = (id) v13[5];
    int v7 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __30__MadGate_isInFieldCollected___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate isInFieldCollected:]_block_invoke", 576, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_isInFieldCollected___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"CollectionLastPerformed"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"CollectionLastPerformed"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (void)updateBasebandTicket:(__SecKey *)a3 baaCert:(__SecCertificate *)a4 baaIntermediateCert:(__SecCertificate *)a5 options:(id)a6 withCompletion:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  if (!a3 || !a4 || !a5)
  {
    id v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 618, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
    id v16 = 0;
    CFDataRef v18 = 0;
    uint64_t v14 = 0;
    id v17 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = (void *)[v12 mutableCopy];
  uint64_t v15 = (id *)(v35 + 5);
  id obj = (id)v35[5];
  id v33 = 0;
  id v16 = security_create_external_representation(a3, &v33, &obj);
  id v17 = v33;
  objc_storeStrong(v15, obj);
  if (!v16)
  {
    id v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 626, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v35[5], @"Failed to encode RK as data.");
    id v16 = 0;
LABEL_11:
    CFDataRef v18 = 0;
    goto LABEL_12;
  }
  [v14 setObject:v17 forKeyedSubscript:@"SigningKeyAttributes"];
  CFDataRef v18 = SecCertificateCopyData(a4);
  if (!v18)
  {
    id v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 634, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate data.");
    goto LABEL_11;
  }
  CFDataRef v19 = SecCertificateCopyData(a5);
  if (v19)
  {
    uint64_t v20 = [(MadGate *)self connection];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3254779904;
    v29[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
    uint64_t v31 = &v34;
    id v21 = v13;
    id v30 = v21;
    id v25 = [(NSXPCConnection *)v20 remoteObjectProxyWithErrorHandler:v29];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3254779904;
    v26[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_105;
    v26[3] = &__block_descriptor_56_e8_32s40bs48r_e34_v24__0__NSDictionary_8__NSError_16l;
    uint64_t v28 = &v34;
    v26[4] = self;
    id v27 = v21;
    [v25 updateBasebandTicket:v16 baaCertData:v18 baaIntermediateCert:v19 options:v14 withCompletionBlock:v26];

    goto LABEL_17;
  }
  id v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 640, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate data.");
LABEL_12:
  uint64_t v23 = (void *)v35[5];
  v35[5] = (uint64_t)v22;

  if (v35[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v35[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v24;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (v13) {
    (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v35[5]);
  }
LABEL_17:

  _Block_object_dispose(&v34, 8);
}

uint64_t __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]_block_invoke", 648, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_105(uint64_t a1, int a2, id a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  id v8 = (id)[*(id *)(a1 + 32) connection];
  [v8 invalidate];
}

- (id)getDCRTState:(id)a3 withError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  CFDataRef v18 = __Block_byref_object_copy_;
  CFDataRef v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = [(MadGate *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  v14[2] = __34__MadGate_getDCRTState_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  id v8 = [(NSXPCConnection *)v7 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3254779904;
  v13[2] = __34__MadGate_getDCRTState_withError___block_invoke_2;
  v13[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v21;
  void v13[5] = &v15;
  [v8 getDCRTStateWithCompletionBlock:v6 withCompletion:v13];
  if (v16[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v10 = (void *)v22[5];
  if (a4 && !v10)
  {
    *a4 = (id) v16[5];
    uint64_t v10 = (void *)v22[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __34__MadGate_getDCRTState_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate getDCRTState:withError:]_block_invoke", 696, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __34__MadGate_getDCRTState_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"DCRTState"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"DCRTState"];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

- (id)copyDCRT:(id)a3 withError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  CFDataRef v18 = __Block_byref_object_copy_;
  CFDataRef v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v7 = [(MadGate *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  v14[2] = __30__MadGate_copyDCRT_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  id v8 = [(NSXPCConnection *)v7 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3254779904;
  v13[2] = __30__MadGate_copyDCRT_withError___block_invoke_2;
  v13[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v21;
  void v13[5] = &v15;
  [v8 copyDCRTWithCompletionBlock:v6 withCompletion:v13];
  if (v16[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v10 = (void *)v22[5];
  if (a4 && !v10)
  {
    *a4 = (id) v16[5];
    uint64_t v10 = (void *)v22[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __30__MadGate_copyDCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate copyDCRT:withError:]_block_invoke", 728, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_copyDCRT_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"DCRTData"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"DCRTData"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)issueDCRT:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = 0;
  id v8 = [(MadGate *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke;
  v16[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
  CFDataRef v18 = v19;
  id v9 = v7;
  id v17 = v9;
  id v10 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v16];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke_106;
  v12[3] = &__block_descriptor_64_e8_32s40bs48r56r_e34_v24__0__NSDictionary_8__NSError_16l;
  uint64_t v14 = v21;
  uint64_t v15 = v19;
  id v11 = v9;
  v12[4] = self;
  id v13 = v11;
  [v10 issueDCRT:v6 withCompletionBlock:v12];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

uint64_t __36__MadGate_issueDCRT_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = createMobileActivationError((uint64_t)"-[MadGate issueDCRT:withCompletion:]_block_invoke", 763, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __36__MadGate_issueDCRT_withCompletion___block_invoke_106(uint64_t a1, id a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"RKCertification"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"RKCertification"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v16 = 138543362;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  id v15 = (id)[*(id *)(a1 + 32) connection];
  [v15 invalidate];
}

- (BOOL)issueUCRT:(id)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = [(MadGate *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3254779904;
  v13[2] = __31__MadGate_issueUCRT_withError___block_invoke;
  v13[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  id v8 = [(NSXPCConnection *)v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __31__MadGate_issueUCRT_withError___block_invoke_2;
  v12[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v12[4] = &v14;
  [v8 issueUCRT:v6 withCompletionBlock:v12];
  uint64_t v9 = v15[5];
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v15[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a4) {
      *a4 = (id) v15[5];
    }
  }

  _Block_object_dispose(&v14, 8);
  return v9 == 0;
}

void __31__MadGate_issueUCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate issueUCRT:withError:]_block_invoke", 807, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_issueUCRT_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)issueCollection:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v8 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __42__MadGate_issueCollection_withCompletion___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v9 = [(NSXPCConnection *)v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __42__MadGate_issueCollection_withCompletion___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v9 issueCollection:v6 withCompletionBlock:v10];
  v7[2](v7, v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __42__MadGate_issueCollection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate issueCollection:withCompletion:]_block_invoke", 836, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __42__MadGate_issueCollection_withCompletion___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)ucrtUpgradeRequired:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  void v10[5] = &v12;
  [v5 ucrtUpgradeRequiredWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  int v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = (id) v13[5];
    int v7 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __31__MadGate_ucrtUpgradeRequired___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate ucrtUpgradeRequired:]_block_invoke", 856, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_ucrtUpgradeRequired___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"UCRTUpgradeRequired"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"UCRTUpgradeRequired"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (__SecIdentity)copyLegacyDeviceIdentity:(id *)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy_;
  uint64_t v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  CFErrorRef error = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3254779904;
  v20[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke;
  v20[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v20[4] = &v34;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v20];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2;
  v19[3] = &__block_descriptor_56_e8_32r40r48r_e34_v24__0__NSDictionary_8__NSError_16l;
  v19[4] = &v28;
  void v19[5] = &v22;
  v19[6] = &v34;
  [v5 copyLegacyDeviceIdentityWithCompletionBlock:v19];
  if (!v35[5])
  {
    CFDataRef v10 = (const __CFData *)v29[5];
    if (v10 && v23[5])
    {
      SecCertificateRef v8 = SecCertificateCreateWithData(0, v10);
      if (v8)
      {
        uint64_t v11 = *MEMORY[0x1E4F3B760];
        uint64_t v12 = *MEMORY[0x1E4F3B6D8];
        v42[0] = *MEMORY[0x1E4F3B718];
        v42[1] = v12;
        uint64_t v13 = *MEMORY[0x1E4F3B6E8];
        v43[0] = v11;
        v43[1] = v13;
        CFDictionaryRef v9 = (const __CFDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
        SecKeyRef v7 = SecKeyCreateWithData((CFDataRef)v23[5], v9, &error);
        if (v7)
        {
          id v6 = (__SecIdentity *)SecIdentityCreate();
          if (v6) {
            goto LABEL_12;
          }
          id v14 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 938, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create identity.");
        }
        else
        {
          id v14 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 932, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to decode private key.");
          SecKeyRef v7 = 0;
        }
LABEL_11:
        uint64_t v16 = (void *)v35[5];
        v35[5] = (uint64_t)v14;

        id v6 = 0;
        goto LABEL_12;
      }
      id v15 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 922, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode certificate.");
    }
    else
    {
      id v15 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 916, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid response.");
    }
    id v14 = v15;
    SecKeyRef v7 = 0;
    SecCertificateRef v8 = 0;
    CFDictionaryRef v9 = 0;
    goto LABEL_11;
  }
  id v6 = 0;
  SecKeyRef v7 = 0;
  SecCertificateRef v8 = 0;
  CFDictionaryRef v9 = 0;
LABEL_12:
  if (v35[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v35[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v17;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (a3 && !v6) {
    *a3 = (id) v35[5];
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v6;
}

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]_block_invoke", 895, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityCertificateDataBlob"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityCertificateDataBlob"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(a1[4] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityPrivateKeyDataBlob"];
  id v14 = isNSData(v13);

  if (v14)
  {
    id v15 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityPrivateKeyDataBlob"];
    uint64_t v16 = [v15 copy];
    uint64_t v17 = *(void *)(a1[5] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  uint64_t v19 = *(void *)(a1[6] + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;
}

- (BOOL)deleteLegacyDeviceIdentity:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2;
  v9[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v9[4] = &v11;
  [v5 deleteLegacyDeviceIdentityWithCompletionBlock:v9];
  uint64_t v6 = v12[5];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate deleteLegacyDeviceIdentity:]_block_invoke", 972, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)copyUCRTVersionInfo:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v4 = [(MadGate *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v5 = [(NSXPCConnection *)v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3254779904;
  v10[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke_2;
  v10[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v18;
  void v10[5] = &v12;
  [v5 copyUCRTVersionInfoWithCompletionBlock:v10];
  if (v13[5] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1DD6B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v7 = (void *)v19[5];
  if (a3 && !v7)
  {
    *a3 = (id) v13[5];
    uint64_t v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __31__MadGate_copyUCRTVersionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = createMobileActivationError((uint64_t)"-[MadGate copyUCRTVersionInfo:]_block_invoke", 1002, @"com.apple.MobileActivation.ErrorDomain", -1, a2, @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_copyUCRTVersionInfo___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"UCRTVersionInfo"];
  id v8 = isNSDictionary(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"UCRTVersionInfo"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

@end