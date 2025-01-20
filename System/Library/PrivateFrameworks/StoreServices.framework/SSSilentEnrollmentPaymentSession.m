@interface SSSilentEnrollmentPaymentSession
- (void)startWithCompletion:(id)a3;
@end

@implementation SSSilentEnrollmentPaymentSession

- (void)startWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSSilentEnrollmentPaymentSession startWithCompletion:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__SSSilentEnrollmentPaymentSession_startWithCompletion___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:211 messageBlock:v19];
}

void __56__SSSilentEnrollmentPaymentSession_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "1", v12);
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v14 initWithXPCEncoding:v15];

        uint64_t v16 = objc_opt_class();
        int v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v16);

        goto LABEL_8;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int v7 = 0;
LABEL_8:
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SSSilentEnrollmentPaymentSession_startWithCompletion___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v9 = *(id *)(a1 + 40);
    id v19 = v6;
    id v20 = v9;
    id v18 = v7;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __56__SSSilentEnrollmentPaymentSession_startWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end