@interface MIBUClient
- (BOOL)_isActivated:(id *)a3;
- (BOOL)_isOnLockScreen;
- (BOOL)isInBoxUpdateMode:(id *)a3;
- (MIBUClient)init;
- (NSXPCConnection)connection;
- (void)_setupConnection;
- (void)connectToWiFi:(id *)a3;
- (void)dealloc;
- (void)eapConfigurationWithCompletion:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)stopWiFiMonitor:(id *)a3;
- (void)terminateInBoxUpdateWithCompletion:(id)a3;
@end

@implementation MIBUClient

- (MIBUClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUClient;
  v2 = [(MIBUClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUClient *)v2 _setupConnection];
  }
  return v3;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(MIBUClient *)self connection];

  if (v3)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_15);
    }
    v4 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"com.apple.inboxupdaterd";
      _os_log_impl(&dword_2309BC000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection to %@", (uint8_t *)&v6, 0xCu);
    }
    objc_super v5 = [(MIBUClient *)self connection];
    [v5 invalidate];

    [(MIBUClient *)self setConnection:0];
  }
}

void __24__MIBUClient_invalidate__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)dealloc
{
  [(MIBUClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MIBUClient;
  [(MIBUClient *)&v3 dealloc];
}

- (BOOL)isInBoxUpdateMode:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint64_t v5 = +[MIBUDefaultPreferences objectForKey:@"CurrentOperation"];
  if ([(MIBUClient *)self _isActivated:0])
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_30_1);
    }
    v12 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v12, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", buf, 2u);
    }
  }
  else
  {
    if ([(MIBUClient *)self _isOnLockScreen]) {
      goto LABEL_4;
    }
    uint64_t v6 = [(MIBUClient *)self connection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_31;
    v17[3] = &unk_264B96BA0;
    v17[4] = &v19;
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v17];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_35;
    v16[3] = &unk_264B96BC8;
    v16[4] = &v19;
    v16[5] = &v25;
    [v7 isInDiagnosticModeWithReply:v16];

    if (*((unsigned char *)v26 + 24))
    {
LABEL_4:
      uint64_t v8 = [(MIBUClient *)self connection];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_43;
      v15[3] = &unk_264B96BA0;
      v15[4] = &v19;
      uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_47;
      v14[3] = &unk_264B96BC8;
      v14[4] = &v19;
      v14[5] = &v25;
      [v9 isInBoxUpdateModeWithReply:v14];
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_42_0);
      }
      v13 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2309BC000, v13, OS_LOG_TYPE_DEFAULT, "Device is not in lock screen and not in Diagnostic mode", buf, 2u);
      }
    }
    if (a3) {
      *a3 = (id) v20[5];
    }
  }
  char v10 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v10;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_33_1);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_35(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_38_0);
  }
  uint64_t v6 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[MIBUClient isInBoxUpdateMode:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_2309BC000, v6, OS_LOG_TYPE_DEFAULT, "%s: isInDiagnosticMode = %d; error = %{public}@",
      (uint8_t *)&v10,
      0x1Cu);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_36()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_40()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_46_1);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_44()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_47(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_50_0);
  }
  uint64_t v6 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[MIBUClient isInBoxUpdateMode:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_2309BC000, v6, OS_LOG_TYPE_DEFAULT, "%s: isInBoxUpdateMode = %d; error = %{public}@",
      (uint8_t *)&v10,
      0x1Cu);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_48()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)eapConfigurationWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v29 = 0;
  v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  uint64_t v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  if ([(MIBUClient *)self _isActivated:0])
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_52_2);
    }
    uint64_t v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", buf, 2u);
    }
    int v13 = v30;
    id obj = v30[5];
    safeAssignError(&obj, 33554433, 0, @"Device already activated", v9, v10, v11, v12, v14);
    objc_storeStrong(v13 + 5, obj);
    v4[2](v4, v24[5], v30[5]);
  }
  else
  {
    uint64_t v5 = [(MIBUClient *)self connection];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_56;
    v19[3] = &unk_264B96BF0;
    uint64_t v6 = v4;
    id v20 = v6;
    uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v19];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_59;
    v15[3] = &unk_264B96C18;
    v17 = &v29;
    v18 = &v23;
    uint64_t v16 = v6;
    [v7 eapConfigurationWithReply:v15];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_58_1);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_59(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_62);
  }
  uint64_t v12 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = "-[MIBUClient eapConfigurationWithCompletion:]_block_invoke";
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_2309BC000, v12, OS_LOG_TYPE_DEFAULT, "%s: tlsCertData = %{public}@; tlsKeyData = %{public}@",
      buf,
      0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a5);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    v17 = 0;
  }
  else
  {
    int v13 = objc_alloc_init(MIBUEAPConfiguartion);
    uint64_t v14 = *(void *)(a1[6] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v16 + 40);
    v17 = +[MIBUCertHelper certificatesFromData:v9 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    uint64_t v18 = *(void *)(a1[5] + 8);
    uint64_t v20 = *(void *)(v18 + 40);
    uint64_t v19 = (id *)(v18 + 40);
    if (!v20)
    {
      id v22 = 0;
      uint64_t v21 = +[MIBUCertHelper suCertKeyFromData:v10 isSEPKey:a4 error:&v22];
      objc_storeStrong(v19, v22);
      if (!*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        [*(id *)(*(void *)(a1[6] + 8) + 40) setTlsCertificateChain:v17];
        [*(id *)(*(void *)(a1[6] + 8) + 40) setTLSKey:v21];
      }
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_2_60()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)terminateInBoxUpdateWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if ([(MIBUClient *)self _isActivated:0])
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_67_2);
    }
    uint64_t v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device is already activated and InBoxUpdate operatons should be terminated", buf, 2u);
    }
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v5 = [(MIBUClient *)self connection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_68;
    v11[3] = &unk_264B96BF0;
    uint64_t v6 = v4;
    id v12 = v6;
    uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_71;
    v9[3] = &unk_264B96BF0;
    id v10 = v6;
    [v7 terminateInBoxUpdateWithReply:v9];
  }
}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_70_1);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

uint64_t __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)connectToWiFi:(id *)a3
{
  if (os_variant_has_internal_content())
  {
    *(void *)buf = 0;
    int v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1;
    uint64_t v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    if ([(MIBUClient *)self _isActivated:0])
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_74);
      }
      uint64_t v8 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", v11, 2u);
      }
    }
    else
    {
      uint64_t v5 = [(MIBUClient *)self connection];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __28__MIBUClient_connectToWiFi___block_invoke_75;
      v10[3] = &unk_264B96BA0;
      v10[4] = buf;
      uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __28__MIBUClient_connectToWiFi___block_invoke_78;
      v9[3] = &unk_264B96BA0;
      void v9[4] = buf;
      [v6 connectToWiFiWithReply:v9];

      if (a3) {
        *a3 = *((id *)v13 + 5);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_84);
    }
    uint64_t v7 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v7, OS_LOG_TYPE_DEFAULT, "connectToWiFi: is only supported on internal builds", buf, 2u);
    }
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_77);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __28__MIBUClient_connectToWiFi___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_81);
  }
  uint64_t v4 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[MIBUClient connectToWiFi:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_2309BC000, v4, OS_LOG_TYPE_DEFAULT, "%s:error = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __28__MIBUClient_connectToWiFi___block_invoke_2_79()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_82()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)stopWiFiMonitor:(id *)a3
{
  if (os_variant_has_internal_content())
  {
    *(void *)buf = 0;
    int v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1;
    uint64_t v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    if ([(MIBUClient *)self _isActivated:0])
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_86_0);
      }
      uint64_t v8 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", v11, 2u);
      }
    }
    else
    {
      uint64_t v5 = [(MIBUClient *)self connection];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __30__MIBUClient_stopWiFiMonitor___block_invoke_87;
      v10[3] = &unk_264B96BA0;
      v10[4] = buf;
      uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __30__MIBUClient_stopWiFiMonitor___block_invoke_90;
      v9[3] = &unk_264B96BA0;
      void v9[4] = buf;
      [v6 stopWiFiMonitorWithReply:v9];

      if (a3) {
        *a3 = *((id *)v13 + 5);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_96_0);
    }
    uint64_t v7 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v7, OS_LOG_TYPE_DEFAULT, "stopWiFiMonitor: is only supported on internal builds", buf, 2u);
    }
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_89);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_93);
  }
  uint64_t v4 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[MIBUClient stopWiFiMonitor:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_2309BC000, v4, OS_LOG_TYPE_DEFAULT, "%s:error = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_2_91()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_94()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)_setupConnection
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.inboxupdaterd" options:0];
  [(MIBUClient *)self setConnection:v3];

  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E542068];
  uint64_t v5 = [(MIBUClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  id v6 = [(MIBUClient *)self connection];
  [v6 resume];
}

- (BOOL)_isActivated:(id *)a3
{
  uint64_t v4 = (void *)MAEGetActivationStateWithError();
  id v5 = 0;
  if (v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_153);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUClient _isActivated:]();
    }
  }
  if (a3) {
    *a3 = v5;
  }
  char v6 = [v4 isEqualToString:*MEMORY[0x263F55840]];

  return v6;
}

void __27__MIBUClient__isActivated___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)_isOnLockScreen
{
  __int16 v4 = 0;
  uint64_t v2 = SBSSpringBoardBlockableServerPort();
  MEMORY[0x230FC4120](v2, (char *)&v4 + 1, &v4);
  return HIBYTE(v4) != 0;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "XPC Connection Error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_isActivated:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "Failed to retrieve device activation state with error: %{public}@", v2, v3, v4, v5, v6);
}

@end