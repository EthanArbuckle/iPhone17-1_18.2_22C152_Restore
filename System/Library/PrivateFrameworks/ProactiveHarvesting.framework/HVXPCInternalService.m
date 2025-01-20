@interface HVXPCInternalService
- (BOOL)contentAvailableFromSources:(unsigned int)a3 error:(id *)a4;
- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4;
- (BOOL)disableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4;
- (BOOL)donateSearchableItem:(id)a3 error:(id *)a4;
- (BOOL)enableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4;
- (BOOL)harvestWithError:(id *)a3;
- (BOOL)overrideIsConnectedToPower:(id)a3 error:(id *)a4;
- (BOOL)refillHarvestBudgetWithError:(id *)a3;
- (BOOL)restoreConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4;
- (HVXPCInternalService)init;
- (id)statsWithError:(id *)a3;
- (id)synchronousProxy;
@end

@implementation HVXPCInternalService

- (void).cxx_destruct
{
}

- (BOOL)harvestWithError:(id *)a3
{
  v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: harvestWithError called.", buf, 2u);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1797;
  v15 = __Block_byref_object_dispose__1798;
  id v16 = 0;
  v6 = [(HVXPCInternalService *)self synchronousProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__HVXPCInternalService_harvestWithError___block_invoke;
  v10[3] = &unk_2647D5BB0;
  v10[4] = &v17;
  v10[5] = buf;
  [v6 harvestWithCompletion:v10];

  int v7 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((unsigned char *)v18 + 24))
  {
    *a3 = *((id *)v12 + 5);
    int v7 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __41__HVXPCInternalService_harvestWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)statsWithError:(id *)a3
{
  v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: statsWithError called.", buf, 2u);
  }

  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__1797;
  v21 = __Block_byref_object_dispose__1798;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1797;
  v15 = __Block_byref_object_dispose__1798;
  id v16 = 0;
  v6 = [(HVXPCInternalService *)self synchronousProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__HVXPCInternalService_statsWithError___block_invoke;
  v10[3] = &unk_2647D5BD8;
  v10[4] = buf;
  v10[5] = &v11;
  [v6 statsWithCompletion:v10];

  int v7 = (void *)*((void *)v18 + 5);
  if (a3 && !v7)
  {
    *a3 = (id) v12[5];
    int v7 = (void *)*((void *)v18 + 5);
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(buf, 8);

  return v8;
}

void __39__HVXPCInternalService_statsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = hv_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: deleteContentWithRequest called.", buf, 2u);
  }

  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HVXPCInternalService.m", 200, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  *(void *)buf = 0;
  id v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1797;
  uint64_t v19 = __Block_byref_object_dispose__1798;
  id v20 = 0;
  uint64_t v9 = [(HVXPCInternalService *)self synchronousProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__HVXPCInternalService_deleteContentWithRequest_error___block_invoke;
  v14[3] = &unk_2647D5BB0;
  v14[4] = &v21;
  v14[5] = buf;
  [v9 deleteContentWithRequest:v7 completion:v14];

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = *((id *)v16 + 5);
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __55__HVXPCInternalService_deleteContentWithRequest_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)donateSearchableItem:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = hv_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: donateSearchableItem called.", buf, 2u);
  }

  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HVXPCInternalService.m", 180, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  *(void *)buf = 0;
  id v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1797;
  uint64_t v19 = __Block_byref_object_dispose__1798;
  id v20 = 0;
  uint64_t v9 = [(HVXPCInternalService *)self synchronousProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__HVXPCInternalService_donateSearchableItem_error___block_invoke;
  v14[3] = &unk_2647D5BB0;
  v14[4] = &v21;
  v14[5] = buf;
  [v9 donateSearchableItem:v7 completion:v14];

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = *((id *)v16 + 5);
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __51__HVXPCInternalService_donateSearchableItem_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)refillHarvestBudgetWithError:(id *)a3
{
  id v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: refillHarvestBudgetWithError", buf, 2u);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1797;
  v15 = __Block_byref_object_dispose__1798;
  id v16 = 0;
  id v6 = [(HVXPCInternalService *)self synchronousProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HVXPCInternalService_refillHarvestBudgetWithError___block_invoke;
  v10[3] = &unk_2647D5BB0;
  v10[4] = &v17;
  v10[5] = buf;
  [v6 refillHarvestBudgetWithCompletion:v10];

  int v7 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((unsigned char *)v18 + 24))
  {
    *a3 = *((id *)v12 + 5);
    int v7 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __53__HVXPCInternalService_refillHarvestBudgetWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)overrideIsConnectedToPower:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: overrideIsConnectedToPower", buf, 2u);
  }

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1797;
  uint64_t v17 = __Block_byref_object_dispose__1798;
  id v18 = 0;
  BOOL v8 = [(HVXPCInternalService *)self synchronousProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__HVXPCInternalService_overrideIsConnectedToPower_error___block_invoke;
  v12[3] = &unk_2647D5BB0;
  v12[4] = &v19;
  v12[5] = buf;
  [v8 overrideIsConnectedToPower:v6 completion:v12];

  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = *((id *)v14 + 5);
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __57__HVXPCInternalService_overrideIsConnectedToPower_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)contentAvailableFromSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: contentAvailableFromSources", buf, 2u);
  }

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1797;
  uint64_t v17 = __Block_byref_object_dispose__1798;
  id v18 = 0;
  BOOL v8 = [(HVXPCInternalService *)self synchronousProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HVXPCInternalService_contentAvailableFromSources_error___block_invoke;
  v12[3] = &unk_2647D5BB0;
  v12[4] = &v19;
  v12[5] = buf;
  [v8 contentAvailableFromSources:v5 completion:v12];

  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = *((id *)v14 + 5);
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __58__HVXPCInternalService_contentAvailableFromSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)restoreConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: restoreConsumptionOfDataSources", buf, 2u);
  }

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1797;
  uint64_t v17 = __Block_byref_object_dispose__1798;
  id v18 = 0;
  BOOL v8 = [(HVXPCInternalService *)self synchronousProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HVXPCInternalService_restoreConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_2647D5BB0;
  v12[4] = &v19;
  v12[5] = buf;
  [v8 restoreConsumptionOfDataSources:v5 completion:v12];

  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = *((id *)v14 + 5);
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__HVXPCInternalService_restoreConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)disableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: disableConsumptionOfDataSources", buf, 2u);
  }

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1797;
  uint64_t v17 = __Block_byref_object_dispose__1798;
  id v18 = 0;
  BOOL v8 = [(HVXPCInternalService *)self synchronousProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HVXPCInternalService_disableConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_2647D5BB0;
  v12[4] = &v19;
  v12[5] = buf;
  [v8 disableConsumptionOfDataSources:v5 completion:v12];

  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = *((id *)v14 + 5);
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__HVXPCInternalService_disableConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)enableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: enableConsumptionOfDataSources", buf, 2u);
  }

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1797;
  uint64_t v17 = __Block_byref_object_dispose__1798;
  id v18 = 0;
  BOOL v8 = [(HVXPCInternalService *)self synchronousProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__HVXPCInternalService_enableConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_2647D5BB0;
  v12[4] = &v19;
  v12[5] = buf;
  [v8 enableConsumptionOfDataSources:v5 completion:v12];

  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = *((id *)v14 + 5);
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __61__HVXPCInternalService_enableConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)synchronousProxy
{
  return (id)[(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_34];
}

void __40__HVXPCInternalService_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = hv_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_226C41000, v3, OS_LOG_TYPE_ERROR, "HVXPCInternalService: error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (HVXPCInternalService)init
{
  v17.receiver = self;
  v17.super_class = (Class)HVXPCInternalService;
  id v2 = [(HVXPCInternalService *)&v17 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DADC298];
    int v4 = (void *)MEMORY[0x22A6667F0]();
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    BOOL v11 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_statsWithCompletion_ argumentIndex:0 ofReply:1];

    id v12 = objc_alloc(MEMORY[0x263F61EB0]);
    uint64_t v13 = hv_default_log_handle();
    uint64_t v14 = [v12 initWithServiceName:@"com.apple.proactive.ProactiveHarvesting.Internal" whitelistedServerInterface:v3 whitelistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_1835 invalidationHandler:&__block_literal_global_31 logHandle:v13];
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v14;
  }
  return v2;
}

void __28__HVXPCInternalService_init__block_invoke_29()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = @"com.apple.proactive.ProactiveHarvesting.Internal";
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __28__HVXPCInternalService_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = @"com.apple.proactive.ProactiveHarvesting.Internal";
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v1, 0xCu);
  }
}

@end