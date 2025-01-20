@interface POAuthPluginProcess
- (BOOL)saveCredentialForUserName:(id)a3 passwordContext:(id)a4;
- (POAuthPluginProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4;
- (unint64_t)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5;
- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4;
- (void)retainContextForUserName:(id)a3 context:(id)a4;
- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8;
- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation POAuthPluginProcess

- (POAuthPluginProcess)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAuthPluginProcess initWithUid:forLogin:]((uint64_t)self, v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)POAuthPluginProcess;
  v8 = [(POAuthPluginCoreProcess *)&v12 initWithUid:v5 forLogin:v4];
  if (v8)
  {
    v9 = [[POServiceConnection alloc] initWithUid:v5 forLogin:v4];
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v9;

    v8->_uid = v5;
  }
  return v8;
}

- (unint64_t)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithBool:v5];
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[POAuthPluginProcess performPasswordLogin:passwordContext:updateLocalAccountPassword:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    v24 = v11;
    __int16 v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_230E51000, v10, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@, updateLocalAccountPassword = %{public}@ on %@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v22 = 0;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke;
  activity_block[3] = &unk_264BBED78;
  activity_block[4] = self;
  id v17 = v8;
  BOOL v20 = v5;
  id v18 = v9;
  v19 = buf;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_230E51000, "PSSOPasswordLogin", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  unint64_t v14 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v14;
}

uint64_t __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke_2;
  v6[3] = &unk_264BBED50;
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 56);
  return [v2 performPasswordLogin:v1 passwordContext:v4 updateLocalAccountPassword:v3 completion:v6];
}

void __87__POAuthPluginProcess_performPasswordLogin_passwordContext_updateLocalAccountPassword___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [MEMORY[0x263F5E5F0] stringForLoginResult:a2];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_230E51000, v6, OS_LOG_TYPE_DEFAULT, "loginResult = %{public}@, error = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)saveCredentialForUserName:(id)a3 passwordContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[POAuthPluginProcess saveCredentialForUserName:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    id v18 = v7;
    __int16 v19 = 2112;
    BOOL v20 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v18) = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke;
  v13[3] = &unk_264BBEDA0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = buf;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_230E51000, "PSSOSaveCredential", OS_ACTIVITY_FLAG_DEFAULT, v13);

  char v11 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v11;
}

uint64_t __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke_2;
  v5[3] = &unk_264BBEC78;
  uint64_t v3 = a1[6];
  v5[4] = a1[7];
  return [v2 saveCredentialForUserName:v1 passwordContext:v3 completion:v5];
}

uint64_t __65__POAuthPluginProcess_saveCredentialForUserName_passwordContext___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "-[POAuthPluginProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:]";
    __int16 v32 = 2114;
    id v33 = v14;
    __int16 v34 = 2114;
    id v35 = v15;
    __int16 v36 = 2114;
    id v37 = v16;
    __int16 v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_230E51000, v18, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@, sccontext = %{public}@, bcontext = %{public}@ on %@", buf, 0x34u);
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke;
  v23[3] = &unk_264BBEDE8;
  v23[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  BOOL v28 = a7;
  BOOL v29 = a8;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  _os_activity_initiate(&dword_230E51000, "PSSOScreenUnlock", OS_ACTIVITY_FLAG_DEFAULT, v23);
}

uint64_t __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) screenDidUnlockWithCredentialContext:*(void *)(a1 + 40) smartCardContext:*(void *)(a1 + 48) biometricContext:*(void *)(a1 + 56) tokenId:*(void *)(a1 + 64) atLogin:*(unsigned __int8 *)(a1 + 72) tokenUnlock:*(unsigned __int8 *)(a1 + 73) completion:&__block_literal_global_4];
}

void __122__POAuthPluginProcess_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock___block_invoke_2()
{
  v0 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEFAULT, "screenDidUnlock completed", v1, 2u);
  }
}

- (void)retainContextForUserName:(id)a3 context:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[POAuthPluginProcess retainContextForUserName:context:]";
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  [(POServiceConnection *)self->_serviceConnection retainContextForUserName:v7 context:v6 completion:&__block_literal_global_7];
}

- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[POAuthPluginProcess updateLocalAccountPassword:passwordContext:completion:]";
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v14, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  uint64_t v13 = [v9 externalizedContext];

  [(POServiceConnection *)serviceConnection updateLocalAccountPassword:v10 passwordContextData:v13 completion:v8];
}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = PO_LOG_POAuthPluginProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[POAuthPluginProcess configurationDidChangeAndRemovedExtension:removed:]";
    __int16 v10 = 2112;
    __int16 v11 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  [(POServiceConnection *)self->_serviceConnection configurationDidChangeAndRemovedExtension:v6 removed:v4 completion:&__block_literal_global_9];
}

- (void).cxx_destruct
{
}

- (void)initWithUid:(uint64_t)a1 forLogin:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[POAuthPluginProcess initWithUid:forLogin:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end