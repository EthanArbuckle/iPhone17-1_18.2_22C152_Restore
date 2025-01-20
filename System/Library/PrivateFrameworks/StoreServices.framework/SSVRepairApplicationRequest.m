@interface SSVRepairApplicationRequest
- (NSNumber)accountDSID;
- (NSString)bundleID;
- (SSVRepairApplicationRequest)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5;
- (SSVRepairApplicationRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)claimStyle;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVRepairApplicationRequest

- (SSVRepairApplicationRequest)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SSVRepairApplicationRequest;
  v10 = [(SSRequest *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_claimStyle = a5;
    uint64_t v12 = [v8 copy];
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    accountDSID = v11->_accountDSID;
    v11->_accountDSID = (NSNumber *)v14;
  }
  return v11;
}

- (void)startWithResponseBlock:(id)a3
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
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSVRepairApplicationRequest startWithResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:148 messageBlock:v19];
}

void __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        objc_opt_class();
        CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(v4, "3");
        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v14 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v13 initWithXPCEncoding:v14];

        BOOL v8 = xpc_dictionary_get_BOOL(v4, "1");
        if (v8)
        {
LABEL_10:
          int v9 = dispatch_get_global_queue(0, 0);
          uint64_t v15 = MEMORY[0x1E4F143A8];
          uint64_t v16 = 3221225472;
          id v17 = __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke_2;
          uint64_t v18 = &unk_1E5BA8010;
          id v10 = *(id *)(a1 + 40);
          id v20 = v6;
          id v21 = v10;
          BOOL v22 = v8;
          CFArrayRef v19 = v7;
          id v11 = v6;
          CFArrayRef v12 = v7;
          dispatch_async(v9, &v15);

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
    CFArrayRef v7 = 0;
    BOOL v8 = 0;
    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v15, v16, v17, v18);
}

uint64_t __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_bundleID);
  SSXPCDictionarySetObject(v3, "1", self->_accountDSID);
  xpc_dictionary_set_int64(v3, "2", self->_claimStyle);
  return v3;
}

- (SSVRepairApplicationRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVRepairApplicationRequest;
    int v6 = [(SSRequest *)&v14 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      bundleID = v6->_bundleID;
      v6->_bundleID = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountDSID = v6->_accountDSID;
      v6->_accountDSID = (NSNumber *)v12;

      v6->_claimStyle = xpc_dictionary_get_int64(v5, "2");
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end