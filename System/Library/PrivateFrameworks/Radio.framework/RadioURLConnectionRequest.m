@interface RadioURLConnectionRequest
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation RadioURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke;
  v7[3] = &unk_2643AA560;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)RadioURLConnectionRequest;
  id v5 = v4;
  [(SSURLConnectionRequest *)&v6 startWithConnectionResponseBlock:v7];
}

void __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 statusCode];
  }
  else
  {
    v9 = [v6 userInfo];
    v10 = [v9 objectForKey:*MEMORY[0x263F7B760]];
    uint64_t v8 = [v10 integerValue];
  }
  if (v8 == 401
    && ([MEMORY[0x263F7B0E8] defaultStore],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 activeAccount],
        v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    v13 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authenticating for 401 response...", buf, 2u);
    }

    v14 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v12];
    [v14 setAccountNameEditable:0];
    [v14 setPromptStyle:1];
    [v14 setAllowsSilentAuthentication:1];
    v15 = (void *)[objc_alloc(MEMORY[0x263F7B118]) initWithAuthenticationContext:v14];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3;
    v19[3] = &unk_2643AA168;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v22 = v16;
    v19[4] = v17;
    id v20 = v5;
    id v21 = v7;
    [v15 startWithAuthenticateResponseBlock:v19];
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v5, v7);
    }
  }
}

void __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = [v3 authenticateResponseType];
    _os_log_impl(&dword_21B56B000, v4, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authentication response type: %ld", buf, 0xCu);
  }

  uint64_t v5 = [v3 authenticateResponseType];
  id v6 = os_log_create("com.apple.amp.radio", "Requests");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5 == 4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Retrying request after authentication...", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)RadioURLConnectionRequest;
    objc_msgSendSuper2(&v10, sel_startWithConnectionResponseBlock_, v8);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authentication failed, not retrying.", buf, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
}

@end