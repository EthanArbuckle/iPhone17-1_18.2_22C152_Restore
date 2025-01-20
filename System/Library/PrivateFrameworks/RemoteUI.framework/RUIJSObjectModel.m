@interface RUIJSObjectModel
@end

@implementation RUIJSObjectModel

uint64_t __RUIJSObjectModel_setFieldValue_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(10);
  uint64_t v1 = RUIJSObjectModel_setFieldValue_reentrancy_sema;
  RUIJSObjectModel_setFieldValue_reentrancy_sema = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __RUIJSObjectModel_loadURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = [NSNumber numberWithBool:a2];
  v16[0] = v7;
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x263F10390] valueWithUndefinedInContext:*(void *)(a1 + 40)];
  }
  v16[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v10 = (id)[v6 callWithArguments:v9];

  if (!v5) {
  v11 = [*(id *)(a1 + 40) exception];
  }

  if (v11 && _isInternalInstall())
  {
    v12 = _RUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 40) exception];
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "xmlui.loadURL: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

void __RUIJSObjectModel_loadURL_block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __RUIJSObjectModel_loadURL_block_invoke_2;
  v8[3] = &unk_264211900;
  id v11 = *(id *)(a1 + 64);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 openLink:v5 HTTPMethod:v6 completion:v8];
}

void __RUIJSObjectModel_loadURL_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  id v7 = *(void **)(a1 + 32);
  if (a2)
  {
    id v8 = (id)[*(id *)(a1 + 32) callWithArguments:0];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F10390];
    id v10 = [v5 localizedDescription];
    id v11 = [v9 valueWithNewErrorFromMessage:v10 inContext:*(void *)(a1 + 40)];
    v14[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v13 = (id)[v7 callWithArguments:v12];
  }
}

void __RUIJSObjectModel_showWebView_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F10390] valueWithObject:a2 inContext:*(void *)(a1 + 32)];
  v4 = [MEMORY[0x263EFF980] array];
  id v5 = v4;
  if (v3) {
    [v4 addObject:v3];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = (void *)[v5 copy];
  id v8 = (id)[v6 callWithArguments:v7];

  id v9 = [*(id *)(a1 + 32) exception];

  if (v9 && _isInternalInstall())
  {
    id v10 = _RUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) exception];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_2144F2000, v10, OS_LOG_TYPE_DEFAULT, "xmlui.showWebView: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

@end