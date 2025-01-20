@interface WebUICertificateError
+ (BOOL)userAllowsCertificateTrust:(__SecTrust *)a3 host:(id)a4;
@end

@implementation WebUICertificateError

+ (BOOL)userAllowsCertificateTrust:(__SecTrust *)a3 host:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263F319A0] defaultTrustManager];
  uint64_t v7 = *MEMORY[0x263F319A8];
  int v8 = [v6 actionForSSLTrust:a3 hostname:v5 service:*MEMORY[0x263F319A8]];
  if (v8)
  {
    if (v8 == 1)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x263F31998]);
      [v10 setTrust:a3];
      v11 = objc_msgSend(v5, "_webkit_decodeHostName");
      [v10 setHost:v11];

      [v10 setService:v7];
      if ([off_2643EFD60 certificateWarningCannotBeBypassedForTrust:a3])
      {
        uint64_t v12 = *MEMORY[0x263F319C0];
        v27[0] = *MEMORY[0x263F319C8];
        v27[1] = v12;
        v28[0] = MEMORY[0x263EFFA80];
        v28[1] = MEMORY[0x263EFFA80];
        v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      }
      else
      {
        v13 = 0;
      }
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __57__WebUICertificateError_userAllowsCertificateTrust_host___block_invoke;
      v17[3] = &unk_2643F0158;
      id v18 = v6;
      v22 = a3;
      id v19 = v5;
      v21 = &v23;
      v15 = v14;
      v20 = v15;
      [v10 showPromptWithOptions:v13 responseBlock:v17];
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v9 = *((unsigned char *)v24 + 24) != 0;

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

intptr_t __57__WebUICertificateError_userAllowsCertificateTrust_host___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 2) {
    [*(id *)(a1 + 32) allowTrust:*(void *)(a1 + 64) forHost:*(void *)(a1 + 40) service:*MEMORY[0x263F319A8]];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (a2 - 1) < 2;
  v4 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v4);
}

@end