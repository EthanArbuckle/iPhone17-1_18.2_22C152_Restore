@interface SXProxyAuthenticationCredentialFactory
- (SXProxyAuthenticationCredentialFactory)initWithKeyProvider:(id)a3;
- (SXProxyAuthenticationKeyProvider)keyProvider;
- (void)createCredentialForResponse:(id)a3 date:(id)a4 completion:(id)a5;
@end

@implementation SXProxyAuthenticationCredentialFactory

- (SXProxyAuthenticationCredentialFactory)initWithKeyProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXProxyAuthenticationCredentialFactory;
  v6 = [(SXProxyAuthenticationCredentialFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyProvider, a3);
  }

  return v7;
}

- (void)createCredentialForResponse:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
    {
      v11 = [(SXProxyAuthenticationCredentialFactory *)self keyProvider];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke;
      v12[3] = &unk_2646542A8;
      id v15 = v10;
      id v13 = v8;
      id v14 = v9;
      [v11 requestAuthenticationKeyWithCompletion:v12];
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    id v8 = [*(id *)(a1 + 32) URL];
    id v9 = [v8 absoluteString];

    unint64_t v10 = [v9 length];
    if (v10 >= 0x63) {
      uint64_t v11 = 99;
    }
    else {
      uint64_t v11 = v10;
    }
    v12 = [v9 substringToIndex:v11];

    [*(id *)(a1 + 40) timeIntervalSince1970];
    id v14 = [NSNumber numberWithDouble:round(v13 * 1000.0)];
    id v15 = [v14 stringValue];

    v30 = v12;
    v16 = [NSString stringWithFormat:@"%@;%@;%@", v5, v15, v12];
    v17 = [v16 dataUsingEncoding:4];
    v29 = [v17 base64EncodedStringWithOptions:0];

    v18 = [v7 dataUsingEncoding:4];
    v19 = [v12 dataUsingEncoding:4];
    v20 = [v15 dataUsingEncoding:4];
    memset(&ctx, 0, sizeof(ctx));
    id v21 = v18;
    CCHmacInit(&ctx, 2u, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
    id v22 = v19;
    CCHmacUpdate(&ctx, (const void *)[v22 bytes], objc_msgSend(v22, "length"));
    id v23 = v20;
    CCHmacUpdate(&ctx, (const void *)[v23 bytes], objc_msgSend(v23, "length"));
    v24 = malloc_type_malloc(0x20uLL, 0x9EE66412uLL);
    CCHmacFinal(&ctx, v24);
    v25 = [MEMORY[0x263EFF8F8] dataWithBytes:v24 length:32];
    v26 = [v25 base64EncodedStringWithOptions:1];
    v27 = [MEMORY[0x263EFC610] credentialWithUser:v29 password:v26 persistence:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v28 = SXProxyLog;
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR)) {
      __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke_cold_1(v28);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (SXProxyAuthenticationKeyProvider)keyProvider
{
  return self->_keyProvider;
}

- (void).cxx_destruct
{
}

void __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222AC5000, log, OS_LOG_TYPE_ERROR, "Received nil key identifier and secret from key provider", v1, 2u);
}

@end