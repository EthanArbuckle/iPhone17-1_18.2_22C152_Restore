@interface SVXInstanceInfoSupplier
- (AFInstanceInfo)cacheInstanceInfo;
- (SVXInstanceInfoSupplier)initWithRemoteDelegateSupplier:(id)a3 performer:(id)a4;
- (void)_updateInstanceInfo:(id)a3;
- (void)getInstanceInfoWithConnection:(id)a3 completion:(id)a4;
@end

@implementation SVXInstanceInfoSupplier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheInstanceInfo, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (AFInstanceInfo)cacheInstanceInfo
{
  return self->_cacheInstanceInfo;
}

- (void)_updateInstanceInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (AFInstanceInfo *)a3;
  cacheInstanceInfo = self->_cacheInstanceInfo;
  if (cacheInstanceInfo != v4 && ([(AFInstanceInfo *)cacheInstanceInfo isEqual:v4] & 1) == 0)
  {
    v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v7 = self->_cacheInstanceInfo;
      int v10 = 136315650;
      v11 = "-[SVXInstanceInfoSupplier _updateInstanceInfo:]";
      __int16 v12 = 2112;
      v13 = v7;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s instanceInfo: %@ -> %@", (uint8_t *)&v10, 0x20u);
    }
    v8 = (AFInstanceInfo *)[(AFInstanceInfo *)v4 copy];
    v9 = self->_cacheInstanceInfo;
    self->_cacheInstanceInfo = v8;
  }
}

- (void)getInstanceInfoWithConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke;
  v11[3] = &unk_264554788;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = *(void (***)(void, void))(a1 + 48);
  if (v1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4)
    {
      v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v14 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        v1 = *(void (***)(void, void))(a1 + 48);
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
      }
      v1[2](v1, v4);
    }
    else
    {
      id v6 = *(void **)(v3 + 16);
      uint64_t v7 = *(void *)(a1 + 40);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_1;
      v11[3] = &unk_264553BF0;
      v11[4] = v3;
      id v12 = v1;
      v8 = [v6 remoteServiceDelegateWithConnection:v7 errorHandler:v11];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_3;
      v9[3] = &unk_264551F68;
      v9[4] = *(void *)(a1 + 32);
      id v10 = *(id *)(a1 + 48);
      [v8 getInstanceInfoWithCompletion:v9];
    }
  }
}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2;
  v6[3] = &unk_2645547D8;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 performBlock:v6];
}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2_4;
  v11[3] = &unk_264554918;
  id v12 = v6;
  id v8 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  [v7 performBlock:v11];
}

uint64_t __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v2;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    [*(id *)(a1 + 40) _updateInstanceInfo:*(void *)(a1 + 48)];
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 136315394;
      id v9 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  return v4();
}

uint64_t __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_220062000, v2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (SVXInstanceInfoSupplier)initWithRemoteDelegateSupplier:(id)a3 performer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXInstanceInfoSupplier;
  uint64_t v9 = [(SVXInstanceInfoSupplier *)&v12 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteDelegateSupplier, a3);
    objc_storeStrong((id *)&v10->_performer, a4);
  }

  return v10;
}

@end