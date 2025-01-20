@interface SSRentalInformationRequest
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (SSRentalInformationRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (SSRentalInformationRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSRentalInformationRequest

- (SSRentalInformationRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSRentalInformationRequest;
  v8 = [(SSRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    rentalKeyIdentifier = v8->_rentalKeyIdentifier;
    v8->_rentalKeyIdentifier = (NSNumber *)v11;
  }
  return v8;
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSRentalInformationRequest startWithResponseBlock:]";
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
  v19[2] = __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:170 messageBlock:v19];
}

void __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
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
        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v14 = xpc_dictionary_get_value(v4, "2");
        int v6 = (void *)[v13 initWithXPCEncoding:v14];

        BOOL v7 = xpc_dictionary_get_BOOL(v4, "1");
        uint64_t v15 = objc_opt_class();
        v8 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "5", v15);
        if (v7)
        {
LABEL_10:
          int v9 = dispatch_get_global_queue(0, 0);
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          uint64_t v18 = __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke_2;
          v19 = &unk_1E5BA8010;
          id v10 = *(id *)(a1 + 40);
          id v21 = v6;
          id v22 = v10;
          BOOL v23 = v7;
          id v20 = v8;
          id v11 = v6;
          id v12 = v8;
          dispatch_async(v9, &v16);

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
    v8 = 0;
    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v16, v17, v18, v19);
}

uint64_t __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_rentalKeyIdentifier);
  return v3;
}

- (SSRentalInformationRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    BOOL v7 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v7;

    objc_opt_class();
    int v9 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "51");
    rentalKeyIdentifier = self->_rentalKeyIdentifier;
    self->_rentalKeyIdentifier = v9;
  }
  else
  {
    rentalKeyIdentifier = self;
    self = 0;
  }

  return self;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end