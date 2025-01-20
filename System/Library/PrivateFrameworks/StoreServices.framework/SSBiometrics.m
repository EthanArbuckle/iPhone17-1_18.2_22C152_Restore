@interface SSBiometrics
- (SSBiometrics)init;
- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4;
- (void)getAllCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6;
- (void)getCachedBiometricAuthenticationContextWithToken:(id)a3 evict:(BOOL)a4 completionBlock:(id)a5;
- (void)getCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6;
- (void)getConstraintsDictionaryForPurpose:(int64_t)a3 completion:(id)a4;
- (void)getCurrentACLVersionWithCompletion:(id)a3;
- (void)getIdentityMapCountWithCompletionBlock:(id)a3;
- (void)getStateWithCompletionBlock:(id)a3;
- (void)isIdentityMapValidForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)renewPurchaseTokenWithAuthToken:(id)a3 completionBlock:(id)a4;
- (void)resetAccount:(id)a3 withCompletionBlock:(id)a4;
- (void)resetWithCompletionBlock:(id)a3;
- (void)saveIdentityMapForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)setAllowed:(BOOL)a3 completionBlock:(id)a4;
- (void)setEnabled:(BOOL)a3 withAuthToken:(id)a4 completionBlock:(id)a5;
- (void)setEnabled:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)tokenUpdateDidFinishWithLogKey:(id)a3 completion:(id)a4;
- (void)tokenUpdateShouldStartWithLogKey:(id)a3 completion:(id)a4;
- (void)tokenUpdateStateWithCompletionBlock:(id)a3;
@end

@implementation SSBiometrics

- (SSBiometrics)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSBiometrics;
  v2 = [(SSBiometrics *)&v11 init];
  if (v2)
  {
    v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v3;

    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSBiometrics.%p", v2);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = v2->_clientQueue;
    v9 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v8, v9);
  }
  return v2;
}

- (void)getAllCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v13 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      int v31 = 136446210;
      v32 = "-[SSBiometrics getAllCachedBiometricHTTPHeadersWithToken:accountID:evict:completionBlock:]";
      LODWORD(v28) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v31, v28);
      free(v18);
      SSFileLog(v13, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v25 = SSXPCCreateMessageDictionary(203);
  SSXPCDictionarySetObject(v25, "1", v12);

  SSXPCDictionarySetObject(v25, "2", v11);
  xpc_dictionary_set_BOOL(v25, "3", a5);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke;
  v29[3] = &unk_1E5BA6EE0;
  v29[4] = self;
  id v30 = v10;
  id v27 = v10;
  [(SSXPCConnection *)connection sendMessage:v25 withReply:v29];
}

void __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    dispatch_queue_t v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v12 = xpc_dictionary_get_value(v4, "2");
  dispatch_queue_t v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedBiometricAuthenticationContextWithToken:(id)a3 evict:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      uint64_t v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      int v28 = 136446210;
      v29 = "-[SSBiometrics getCachedBiometricAuthenticationContextWithToken:evict:completionBlock:]";
      LODWORD(v25) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v28, v25);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = SSXPCCreateMessageDictionary(195);
  SSXPCDictionarySetObject(v22, "1", v9);

  xpc_dictionary_set_BOOL(v22, "2", a4);
  connection = self->_connection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke;
  v26[3] = &unk_1E5BA6EE0;
  v26[4] = self;
  id v27 = v8;
  id v24 = v8;
  [(SSXPCConnection *)connection sendMessage:v22 withReply:v26];
}

void __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    dispatch_queue_t v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [SSBiometricAuthenticationContext alloc];
  int v11 = xpc_dictionary_get_value(v4, "0");
  v7 = [(SSBiometricAuthenticationContext *)v10 initWithXPCEncoding:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  v13 = xpc_dictionary_get_value(v4, "1");
  dispatch_queue_t v6 = (void *)[v12 initWithXPCEncoding:v13];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v17 = v8;
    id v15 = v7;
    id v16 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v13 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      int v31 = 136446210;
      v32 = "-[SSBiometrics getCachedBiometricHTTPHeadersWithToken:accountID:evict:completionBlock:]";
      LODWORD(v28) = 12;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v31, v28);
      free(v18);
      SSFileLog(v13, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v25 = SSXPCCreateMessageDictionary(196);
  SSXPCDictionarySetObject(v25, "1", v12);

  SSXPCDictionarySetObject(v25, "2", v11);
  xpc_dictionary_set_BOOL(v25, "3", a5);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke;
  v29[3] = &unk_1E5BA6EE0;
  v29[4] = self;
  id v30 = v10;
  id v27 = v10;
  [(SSXPCConnection *)connection sendMessage:v25 withReply:v29];
}

void __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    dispatch_queue_t v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    v7 = 0;
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v13 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v13);
  uint64_t v14 = objc_opt_class();
  id v8 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "1", v14);
  uint64_t v15 = objc_opt_class();
  id v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "2", v15);
  uint64_t v16 = objc_opt_class();
  id v10 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v16);
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = xpc_dictionary_get_value(v4, "4");
  dispatch_queue_t v6 = (void *)[v17 initWithXPCEncoding:v18];

LABEL_7:
  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2;
    v19[3] = &unk_1E5BAE328;
    id v25 = v11;
    id v20 = v7;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v24 = v6;
    dispatch_async(v12, v19);
  }
}

uint64_t __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)getConstraintsDictionaryForPurpose:(int64_t)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v25 = 136446210;
      v26 = "-[SSBiometrics getConstraintsDictionaryForPurpose:completion:]";
      LODWORD(v22) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v25, v22);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v19 = SSXPCCreateMessageDictionary(214);
  xpc_dictionary_set_BOOL(v19, "1", a3 == 0);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke;
  v23[3] = &unk_1E5BA6EE0;
  v23[4] = self;
  id v24 = v6;
  id v21 = v6;
  [(SSXPCConnection *)connection sendMessage:v19 withReply:v23];
}

void __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v12 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCurrentACLVersionWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      id v24 = "-[SSBiometrics getCurrentACLVersionWithCompletion:]";
      LODWORD(v20) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(213);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke;
  v21[3] = &unk_1E5BA6EE0;
  v21[4] = self;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  int v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = xpc_dictionary_get_value(v4, "1");
  int v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getStateWithCompletionBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      id v24 = "-[SSBiometrics getStateWithCompletionBlock:]";
      LODWORD(v20) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(122);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__SSBiometrics_getStateWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA6EE0;
  v21[4] = self;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __44__SSBiometrics_getStateWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int64_t int64 = 5;
    goto LABEL_7;
  }
  int64_t int64 = xpc_dictionary_get_int64(v4, "0");
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = xpc_dictionary_get_value(v4, "1");
  int v6 = (void *)[v10 initWithXPCEncoding:v11];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SSBiometrics_getStateWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6F08;
    id v14 = v8;
    int64_t v15 = int64;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __44__SSBiometrics_getStateWithCompletionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)renewPurchaseTokenWithAuthToken:(id)a3 completionBlock:(id)a4
{
}

- (void)resetAccount:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      int v23 = "-[SSBiometrics resetAccount:withCompletionBlock:]";
      LODWORD(v21) = 12;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(125);
  SSXPCDictionarySetObject(v20, "1", v7);

  [(SSBiometrics *)self _sendMessage:v20 withCompletionBlock:v6];
}

- (void)resetWithCompletionBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v19 = 136446210;
      xpc_object_t v20 = "-[SSBiometrics resetWithCompletionBlock:]";
      LODWORD(v18) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(124);
  [(SSBiometrics *)self _sendMessage:v17 withCompletionBlock:v4];
}

- (void)setEnabled:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  int v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  id v8 = [v6 data];
  [(SSBiometrics *)self setEnabled:v4 withAuthToken:v8 completionBlock:v7];
}

- (void)setEnabled:(BOOL)a3 withAuthToken:(id)a4 completionBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = (__CFString *)a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      int v24 = 136446210;
      uint64_t v25 = "-[SSBiometrics setEnabled:withAuthToken:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v24, v23);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = SSXPCCreateMessageDictionary(123);
  xpc_dictionary_set_BOOL(v22, "1", a3);
  SSXPCDictionarySetCFObject(v22, "2", v9);

  [(SSBiometrics *)self _sendMessage:v22 withCompletionBlock:v8];
}

- (void)setAllowed:(BOOL)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v21 = 136446210;
      xpc_object_t v22 = "-[SSBiometrics setAllowed:completionBlock:]";
      LODWORD(v20) = 12;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v21, v20);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v19 = SSXPCCreateMessageDictionary(126);
  xpc_dictionary_set_BOOL(v19, "1", a3);
  [(SSBiometrics *)self _sendMessage:v19 withCompletionBlock:v6];
}

- (void)tokenUpdateDidFinishWithLogKey:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      uint64_t v27 = "-[SSBiometrics tokenUpdateDidFinishWithLogKey:completion:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(206);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke;
  v24[3] = &unk_1E5BA6EE0;
  v24[4] = self;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    goto LABEL_7;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v10 = xpc_dictionary_get_value(v4, "0");
  id v6 = (void *)[v9 initWithXPCEncoding:v10];

LABEL_7:
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    int v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke_2;
    v11[3] = &unk_1E5BA7328;
    id v13 = v7;
    id v12 = v6;
    dispatch_async(v8, v11);
  }
}

uint64_t __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)tokenUpdateShouldStartWithLogKey:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      uint64_t v27 = "-[SSBiometrics tokenUpdateShouldStartWithLogKey:completion:]";
      LODWORD(v23) = 12;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(207);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke;
  v24[3] = &unk_1E5BA6EE0;
  v24[4] = self;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 1;
    goto LABEL_7;
  }
  BOOL v7 = xpc_dictionary_get_BOOL(v4, "0");
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v11 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v10 initWithXPCEncoding:v11];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke_2;
    block[3] = &unk_1E5BAB848;
    id v14 = v8;
    BOOL v15 = v7;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)tokenUpdateStateWithCompletionBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      int v24 = "-[SSBiometrics tokenUpdateStateWithCompletionBlock:]";
      LODWORD(v20) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(208);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA6EE0;
  v21[4] = self;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    int64_t int64 = 0;
    goto LABEL_7;
  }
  int64_t int64 = xpc_dictionary_get_int64(v4, "0");
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = xpc_dictionary_get_value(v4, "1");
  int v6 = (void *)[v10 initWithXPCEncoding:v11];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6F08;
    id v14 = v8;
    int64_t v15 = int64;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)getIdentityMapCountWithCompletionBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      int v24 = "-[SSBiometrics getIdentityMapCountWithCompletionBlock:]";
      LODWORD(v20) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(182);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA6EE0;
  v21[4] = self;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  uint64_t v7 = [v11 unsignedIntegerValue];

  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v13 = xpc_dictionary_get_value(v4, "1");
  int v6 = (void *)[v12 initWithXPCEncoding:v13];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6F08;
    id v16 = v8;
    uint64_t v17 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)isIdentityMapValidForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      int v23 = "-[SSBiometrics isIdentityMapValidForAccountIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(183);
  SSXPCDictionarySetObject(v20, "1", v7);

  [(SSBiometrics *)self _sendMessage:v20 withCompletionBlock:v6];
}

- (void)saveIdentityMapForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      int v23 = "-[SSBiometrics saveIdentityMapForAccountIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(184);
  SSXPCDictionarySetObject(v20, "1", v7);

  [(SSBiometrics *)self _sendMessage:v20 withCompletionBlock:v6];
}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E5BA6EE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SSXPCConnection *)connection sendMessage:a3 withReply:v9];
}

void __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = xpc_dictionary_get_BOOL(v4, "0");
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v10 initWithXPCEncoding:v11];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BAB848;
    id v14 = v8;
    BOOL v15 = v7;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end