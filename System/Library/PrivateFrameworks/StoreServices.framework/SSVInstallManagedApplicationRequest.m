@interface SSVInstallManagedApplicationRequest
- (BOOL)skipDownloads;
- (NSNumber)externalVersionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)itemIdentifier;
- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6;
- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7;
- (SSVInstallManagedApplicationRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setSkipDownloads:(BOOL)a3;
- (void)startWithDetailedResponseBlock:(id)a3;
- (void)startWithMetadataResponseBlock:(id)a3;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVInstallManagedApplicationRequest

- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SSVInstallManagedApplicationRequest;
  v14 = [(SSRequest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    bundleVersion = v14->_bundleVersion;
    v14->_bundleVersion = (NSString *)v17;

    uint64_t v19 = [v11 copy];
    externalVersionIdentifier = v14->_externalVersionIdentifier;
    v14->_externalVersionIdentifier = (NSNumber *)v19;

    uint64_t v21 = [v10 copy];
    itemIdentifier = v14->_itemIdentifier;
    v14->_itemIdentifier = (NSString *)v21;
  }
  return v14;
}

- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SSVInstallManagedApplicationRequest;
  v16 = [(SSRequest *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v15 copy];
    bundleVersion = v16->_bundleVersion;
    v16->_bundleVersion = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    externalVersionIdentifier = v16->_externalVersionIdentifier;
    v16->_externalVersionIdentifier = (NSNumber *)v21;

    uint64_t v23 = [v12 copy];
    itemIdentifier = v16->_itemIdentifier;
    v16->_itemIdentifier = (NSString *)v23;

    v16->_skipDownloads = a7;
  }

  return v16;
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
      v22 = "-[SSVInstallManagedApplicationRequest startWithResponseBlock:]";
      LODWORD(v18) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

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
  v19[2] = __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:112 messageBlock:v19];
}

void __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
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
          block[2] = __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke_2;
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

uint64_t __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)startWithDetailedResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      v22 = "-[SSVInstallManagedApplicationRequest startWithDetailedResponseBlock:]";
      LODWORD(v18) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

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
  v19[2] = __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:113 messageBlock:v19];
}

void __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v12 initWithXPCEncoding:v13];

        BOOL v7 = xpc_dictionary_get_BOOL(v4, "1");
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v14);
        uint64_t v16 = v15;
        if (v15) {
          uint64_t v8 = [v15 integerValue];
        }
        else {
          uint64_t v8 = 0;
        }

        if (v7) {
          goto LABEL_10;
        }
        goto LABEL_8;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 0;
    uint64_t v8 = 0;
LABEL_8:
    if (!v6)
    {
      int v6 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
LABEL_10:
    int v9 = dispatch_get_global_queue(0, 0);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke_2;
    id v20 = &unk_1E5BAB870;
    id v10 = *(id *)(a1 + 40);
    BOOL v24 = v7;
    id v22 = v10;
    uint64_t v23 = v8;
    id v21 = v6;
    id v11 = v6;
    dispatch_async(v9, &v17);
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v17, v18, v19, v20);
}

uint64_t __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)startWithMetadataResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      id v22 = "-[SSVInstallManagedApplicationRequest startWithMetadataResponseBlock:]";
      LODWORD(v18) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:113 messageBlock:v19];
}

void __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v14 initWithXPCEncoding:v15];

        BOOL v7 = xpc_dictionary_get_BOOL(v4, "1");
        uint64_t v16 = objc_opt_class();
        id v17 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v16);
        uint64_t v18 = v17;
        if (v17) {
          uint64_t v8 = [v17 integerValue];
        }
        else {
          uint64_t v8 = 0;
        }
        uint64_t v19 = objc_opt_class();
        int v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "5", v19);

        if (v7) {
          goto LABEL_10;
        }
        goto LABEL_8;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    BOOL v7 = 0;
    uint64_t v8 = 0;
    int v9 = 0;
LABEL_8:
    if (!v6)
    {
      int v6 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
LABEL_10:
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BAB898;
    id v11 = *(id *)(a1 + 40);
    BOOL v25 = v7;
    id v23 = v11;
    uint64_t v24 = v8;
    id v21 = v9;
    id v22 = v6;
    id v12 = v6;
    id v13 = v9;
    dispatch_async(v10, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_itemIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_externalVersionIdentifier);
  SSXPCDictionarySetObject(v3, "2", self->_bundleIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_bundleVersion);
  xpc_dictionary_set_BOOL(v3, "4", self->_skipDownloads);
  return v3;
}

- (SSVInstallManagedApplicationRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v20.receiver = self;
    v20.super_class = (Class)SSVInstallManagedApplicationRequest;
    int v6 = [(SSRequest *)&v20 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      itemIdentifier = v6->_itemIdentifier;
      v6->_itemIdentifier = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      externalVersionIdentifier = v6->_externalVersionIdentifier;
      v6->_externalVersionIdentifier = (NSNumber *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
      bundleVersion = v6->_bundleVersion;
      v6->_bundleVersion = (NSString *)v18;

      v6->_skipDownloads = xpc_dictionary_get_BOOL(v5, "4");
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (BOOL)skipDownloads
{
  return self->_skipDownloads;
}

- (void)setSkipDownloads:(BOOL)a3
{
  self->_skipDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end