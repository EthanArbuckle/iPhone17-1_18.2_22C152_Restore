@interface SSKeychain
- (SSKeychain)init;
- (void)_sendMessage:(id)a3 completionBlock:(id)a4;
- (void)createAttestationDataForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5;
- (void)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5;
- (void)deleteKeychainTokensForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)getPublicKeyDataForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)getPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5;
- (void)keyCountForAccountIdentifier:(id)a3 completionBlock:(id)a4;
- (void)signData:(id)a3 context:(id)a4 completionBlock:(id)a5;
- (void)signData:(id)a3 reason:(id)a4 fallback:(id)a5 cancel:(id)a6 forAccountIdentifier:(id)a7 completionBlock:(id)a8;
- (void)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 completionBlock:(id)a6;
@end

@implementation SSKeychain

- (SSKeychain)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSKeychain;
  v2 = [(SSKeychain *)&v11 init];
  if (v2)
  {
    v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v3;

    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSKeychain.%p", v2);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v2->_dispatchQueue;
    v9 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v8, v9);
  }
  return v2;
}

- (void)createAttestationDataForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
}

- (void)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      v10 = +[SSLogConfig sharedConfig];
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
      int v25 = 136446210;
      v26 = "-[SSKeychain createAttestationDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v24) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v25, v24);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = SSXPCCreateMessageDictionary(179);
  SSXPCDictionarySetObject(v22, "1", v9);

  v23 = [NSNumber numberWithInteger:a4];
  SSXPCDictionarySetObject(v22, "2", v23);

  [(SSKeychain *)self _sendMessage:v22 completionBlock:v8];
}

- (void)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      v10 = +[SSLogConfig sharedConfig];
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
      int v29 = 136446210;
      v30 = "-[SSKeychain createX509CertChainDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v26) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v29, v26);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = SSXPCCreateMessageDictionary(204);
  SSXPCDictionarySetObject(v22, "1", v9);

  v23 = [NSNumber numberWithInteger:a4];
  SSXPCDictionarySetObject(v22, "2", v23);

  connection = self->_connection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke;
  v27[3] = &unk_1E5BA6EE0;
  v27[4] = self;
  id v28 = v8;
  id v25 = v8;
  [(SSXPCConnection *)connection sendMessage:v22 withReply:v27];
}

void __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke(uint64_t a1, void *a2)
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
  int v12 = xpc_dictionary_get_value(v4, "1");
  dispatch_queue_t v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteKeychainTokensForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      uint64_t v27 = "-[SSKeychain deleteKeychainTokensForAccountIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(185);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA6EE0;
  v24[4] = self;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
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
    id v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  id v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v12 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) isEqualToNumber:&unk_1EF9A9768];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

- (void)getPublicKeyDataForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
}

- (void)getPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      int v25 = 136446210;
      int v26 = "-[SSKeychain getPublicKeyDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v24) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v25, v24);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = SSXPCCreateMessageDictionary(180);
  SSXPCDictionarySetObject(v22, "1", v9);

  uint64_t v23 = [NSNumber numberWithInteger:a4];
  SSXPCDictionarySetObject(v22, "2", v23);

  [(SSKeychain *)self _sendMessage:v22 completionBlock:v8];
}

- (void)keyCountForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
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
      uint64_t v27 = "-[SSKeychain keyCountForAccountIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

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
  xpc_object_t v20 = SSXPCCreateMessageDictionary(202);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA6EE0;
  v24[4] = self;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
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
    uint64_t uint64 = 0;
    goto LABEL_7;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "0");
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v11 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v10 initWithXPCEncoding:v11];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6F08;
    id v14 = v8;
    uint64_t v15 = uint64;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)signData:(id)a3 reason:(id)a4 fallback:(id)a5 cancel:(id)a6 forAccountIdentifier:(id)a7 completionBlock:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    xpc_object_t v20 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v20)
    {
      xpc_object_t v20 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    uint64_t v23 = [v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      int v24 = v22;
    }
    else {
      int v24 = v22 & 2;
    }
    if (v24)
    {
      int v34 = 136446210;
      v35 = "-[SSKeychain signData:reason:fallback:cancel:forAccountIdentifier:completionBlock:]";
      LODWORD(v33) = 12;
      id v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v34, v33);
      free(v25);
      SSFileLog(v20, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v23);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v32 = SSXPCCreateMessageDictionary(181);
  SSXPCDictionarySetObject(v32, "1", v19);

  SSXPCDictionarySetObject(v32, "2", v18);
  SSXPCDictionarySetObject(v32, "3", v17);

  SSXPCDictionarySetObject(v32, "4", v16);
  SSXPCDictionarySetObject(v32, "5", v15);

  [(SSKeychain *)self _sendMessage:v32 completionBlock:v14];
}

- (void)signData:(id)a3 context:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      int v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      int v25 = 136446210;
      uint64_t v26 = "-[SSKeychain signData:context:completionBlock:]";
      LODWORD(v24) = 12;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v25, v24);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v23 = SSXPCCreateMessageDictionary(192);
  SSXPCDictionarySetObject(v23, "1", v10);

  SSXPCDictionarySetObject(v23, "2", v9);
  [(SSKeychain *)self _sendMessage:v23 completionBlock:v8];
}

- (void)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v12 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v12)
    {
      int v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    int v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      int v32 = 136446210;
      uint64_t v33 = "-[SSKeychain x509CertChainDataForAccountIdentifier:purpose:regenerateCerts:completionBlock:]";
      LODWORD(v29) = 12;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v32, v29);
      free(v17);
      SSFileLog(v12, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v24 = SSXPCCreateMessageDictionary(205);
  SSXPCDictionarySetObject(v24, "1", v11);

  int v25 = [NSNumber numberWithInteger:a4];
  SSXPCDictionarySetObject(v24, "2", v25);

  uint64_t v26 = [NSNumber numberWithBool:v6];
  SSXPCDictionarySetObject(v24, "3", v26);

  connection = self->_connection;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke;
  v30[3] = &unk_1E5BA6EE0;
  v30[4] = self;
  id v31 = v10;
  id v28 = v10;
  [(SSXPCConnection *)connection sendMessage:v24 withReply:v30];
}

void __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    BOOL v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    id v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  id v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v12 = xpc_dictionary_get_value(v4, "1");
  BOOL v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SSKeychain__sendMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E5BA6EE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SSXPCConnection *)connection sendMessage:a3 withReply:v9];
}

void __43__SSKeychain__sendMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
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
    id v7 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_class();
  id v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v12 = xpc_dictionary_get_value(v4, "1");
  id v6 = (void *)[v11 initWithXPCEncoding:v12];

LABEL_7:
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SSKeychain__sendMessage_completionBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v16 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __43__SSKeychain__sendMessage_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end