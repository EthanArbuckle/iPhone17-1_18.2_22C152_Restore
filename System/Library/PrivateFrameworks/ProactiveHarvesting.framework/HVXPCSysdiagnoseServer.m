@interface HVXPCSysdiagnoseServer
- (void)sysdiagnoseStringWithCompletion:(id)a3;
@end

@implementation HVXPCSysdiagnoseServer

- (void)sysdiagnoseStringWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseServer: sysdiagnoseStringWithCompletion called.", buf, 2u);
  }

  *(void *)buf = 0;
  v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__45;
  v22 = __Block_byref_object_dispose__46;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__45;
  v16 = __Block_byref_object_dispose__46;
  id v17 = 0;
  v5 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__HVXPCSysdiagnoseServer_sysdiagnoseStringWithCompletion___block_invoke;
  v11[3] = &unk_2647D5BD8;
  v11[4] = &v12;
  v11[5] = buf;
  [v5 statsWithCompletion:v11];

  uint64_t v6 = v13[5];
  v7 = (id *)(v19 + 40);
  if (v6)
  {
    id obj = (id)*((void *)v19 + 5);
    v8 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&obj];
    objc_storeStrong(v7, obj);
    if (v8)
    {
      v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      v3[2](v3, v9, 0);
    }
    else
    {
      v3[2](v3, 0, *((void *)v19 + 5));
    }
  }
  else
  {
    v3[2](v3, 0, *((void *)v19 + 5));
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
}

void __58__HVXPCSysdiagnoseServer_sysdiagnoseStringWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v8 = hv_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_226C41000, v8, OS_LOG_TYPE_ERROR, "HVXPCSysdiagnoseServer: sysdiagnoseStringWithCompletion: error: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

@end