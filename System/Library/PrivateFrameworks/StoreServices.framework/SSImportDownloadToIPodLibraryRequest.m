@interface SSImportDownloadToIPodLibraryRequest
- (SSDownloadMetadata)downloadMetadata;
- (SSImportDownloadToIPodLibraryRequest)initWithDownloadMetadata:(id)a3;
- (SSImportDownloadToIPodLibraryRequest)initWithPurchase:(id)a3;
- (SSImportDownloadToIPodLibraryRequest)initWithXPCEncoding:(id)a3;
- (SSPurchaseResponse)purchaseResponse;
- (id)copyXPCEncoding;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSImportDownloadToIPodLibraryRequest

- (SSImportDownloadToIPodLibraryRequest)initWithDownloadMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
  v6 = [(SSRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_downloadMetadata, a3);
  }

  return v7;
}

- (SSImportDownloadToIPodLibraryRequest)initWithPurchase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
  v6 = [(SSRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_purchaseResponse, a3);
  }

  return v7;
}

- (void)startWithResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSImportDownloadToIPodLibraryRequest startWithResponseBlock:]";
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
  v19[2] = __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:66 messageBlock:v19];
}

void __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v12 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v11 initWithXPCEncoding:v12];

        BOOL v7 = xpc_dictionary_get_BOOL(v4, "1");
        if (v7)
        {
LABEL_10:
          v8 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke_2;
          block[3] = &unk_1E5BAB848;
          id v9 = *(id *)(a1 + 40);
          BOOL v16 = v7;
          id v14 = v6;
          id v15 = v9;
          id v10 = v6;
          dispatch_async(v8, block);

          goto LABEL_11;
        }
LABEL_8:
        if (!v6)
        {
          int v6 = SSError(@"SSErrorDomain", 100, 0, 0);
        }
        goto LABEL_10;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 0;
    goto LABEL_8;
  }
LABEL_11:
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [(SSPurchaseResponse *)self->_purchaseResponse copyXPCEncoding];
  if (v4) {
    xpc_dictionary_set_value(v3, "0", v4);
  }
  id v5 = [(SSDownloadMetadata *)self->_downloadMetadata copyXPCEncoding];
  if (v5) {
    xpc_dictionary_set_value(v3, "1", v5);
  }

  return v3;
}

- (SSImportDownloadToIPodLibraryRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
    int v6 = [(SSRequest *)&v14 init];
    if (v6)
    {
      v8 = xpc_dictionary_get_value(v5, "0");
      if (v8)
      {
        id v9 = [[SSPurchaseResponse alloc] initWithXPCEncoding:v8];
        purchaseResponse = v6->_purchaseResponse;
        v6->_purchaseResponse = v9;
      }
      id v11 = xpc_dictionary_get_value(v5, "1");
      if (v11)
      {
        uint64_t v12 = [[SSDownloadMetadata alloc] initWithXPCEncoding:v11];
        downloadMetadata = v6->_downloadMetadata;
        v6->_downloadMetadata = v12;
      }
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (SSDownloadMetadata)downloadMetadata
{
  return self->_downloadMetadata;
}

- (SSPurchaseResponse)purchaseResponse
{
  return self->_purchaseResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResponse, 0);
  objc_storeStrong((id *)&self->_downloadMetadata, 0);
}

@end