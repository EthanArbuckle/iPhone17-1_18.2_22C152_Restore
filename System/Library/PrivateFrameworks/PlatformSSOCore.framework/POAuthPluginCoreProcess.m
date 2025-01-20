@interface POAuthPluginCoreProcess
- (POAuthPluginCoreProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4;
- (unint64_t)getLoginTypeForUser:(id)a3;
- (unint64_t)verifyPasswordLogin:(id)a3 passwordContext:(id)a4;
- (unint64_t)verifyPasswordUser:(id)a3 passwordContext:(id)a4 tokens:(id *)a5;
@end

@implementation POAuthPluginCoreProcess

- (POAuthPluginCoreProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAuthPluginCoreProcess initWithUid:forLogin:]((uint64_t)self, v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)POAuthPluginCoreProcess;
  v8 = [(POAuthPluginCoreProcess *)&v12 init];
  if (v8)
  {
    v9 = [[POServiceCoreConnection alloc] initWithUid:v5 forLogin:v4];
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v9;

    v8->_uid = v5;
  }
  return v8;
}

- (unint64_t)getLoginTypeForUser:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[POAuthPluginCoreProcess getLoginTypeForUser:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v11 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__POAuthPluginCoreProcess_getLoginTypeForUser___block_invoke;
  v9[3] = &unk_2654641C8;
  v9[4] = buf;
  [(POServiceCoreConnection *)serviceConnection getLoginTypeForUser:v4 completion:v9];
  unint64_t v7 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __47__POAuthPluginCoreProcess_getLoginTypeForUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_259DFE000, v6, OS_LOG_TYPE_DEFAULT, "loginType = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (unint64_t)verifyPasswordLogin:(id)a3 passwordContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[POCredentialUtil maskName:v6];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[POAuthPluginCoreProcess verifyPasswordLogin:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v19 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke;
  v14[3] = &unk_2654641A0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v17 = buf;
  id v10 = v7;
  id v11 = v6;
  _os_activity_initiate(&dword_259DFE000, "PSSOPasswordVerify", OS_ACTIVITY_FLAG_DEFAULT, v14);

  unint64_t v12 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke_2;
  v5[3] = &unk_2654641C8;
  uint64_t v3 = a1[6];
  v5[4] = a1[7];
  return [v2 verifyPasswordLogin:v1 passwordContext:v3 completion:v5];
}

void __63__POAuthPluginCoreProcess_verifyPasswordLogin_passwordContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[POConstantCoreUtil stringForLoginResult:a2];
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_259DFE000, v6, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (unint64_t)verifyPasswordUser:(id)a3 passwordContext:(id)a4 tokens:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  __int16 v10 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[POCredentialUtil maskName:v8];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[POAuthPluginCoreProcess verifyPasswordUser:passwordContext:tokens:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    v26 = v9;
    LOWORD(v27) = 2112;
    *(void *)((char *)&v27 + 2) = self;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  *(void *)&long long v27 = __Block_byref_object_dispose__2;
  *((void *)&v27 + 1) = 0;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke;
  activity_block[3] = &unk_265464218;
  activity_block[4] = self;
  id v12 = v8;
  id v17 = v12;
  v13 = v9;
  v18 = v13;
  id v19 = &v21;
  __int16 v20 = buf;
  _os_activity_initiate(&dword_259DFE000, "PSSOPasswordVerify", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  unint64_t v14 = v22[3];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke_2;
  v5[3] = &unk_2654641F0;
  long long v6 = *(_OWORD *)(a1 + 56);
  return [v2 verifyPasswordUser:v1 passwordContext:v3 completion:v5];
}

void __69__POAuthPluginCoreProcess_verifyPasswordUser_passwordContext_tokens___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a7;
  id v12 = PO_LOG_POAuthPluginCoreProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = +[POConstantCoreUtil stringForLoginResult:a2];
    int v16 = 138543618;
    id v17 = v13;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_259DFE000, v12, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v16, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v10;
}

- (void).cxx_destruct
{
}

- (void)initWithUid:(uint64_t)a1 forLogin:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[POAuthPluginCoreProcess initWithUid:forLogin:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end