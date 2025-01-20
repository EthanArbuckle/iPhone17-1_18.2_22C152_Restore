@interface SSRentalSyncRequest
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (SSRentalSyncRequest)initWithAccountIdentifier:(id)a3;
- (SSRentalSyncRequest)initWithSinfs:(id)a3;
- (SSRentalSyncRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SSRentalSyncRequest

- (SSRentalSyncRequest)initWithSinfs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSRentalSyncRequest;
    v5 = [(SSRequest *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      sinfs = v5->_sinfs;
      v5->_sinfs = (NSArray *)v6;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have at least one sinf"];
    v5 = 0;
  }

  return v5;
}

- (SSRentalSyncRequest)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 unsignedLongLongValue])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSRentalSyncRequest;
    v5 = [(SSRequest *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSNumber *)v6;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have a valid account identifier"];
    v5 = 0;
  }

  return v5;
}

- (void)startWithConnectionResponseBlock:(id)a3
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
      v22 = "-[SSRentalSyncRequest startWithConnectionResponseBlock:]";
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
  v19[2] = __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:1016 messageBlock:v19];
}

void __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
      v10 = 0;
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "1");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];

      v8 = [SSURLConnectionResponse alloc];
      int v9 = xpc_dictionary_get_value(v4, "2");
      v10 = [(SSURLConnectionResponse *)v8 initWithXPCEncoding:v9];
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v12 = *(id *)(a1 + 40);
    id v17 = v7;
    id v18 = v12;
    uint64_t v16 = v10;
    id v13 = v7;
    uint64_t v14 = v10;
    dispatch_async(v11, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_sinfs);
  return v3;
}

- (SSRentalSyncRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    int v7 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v7;

    objc_opt_class();
    int v9 = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(v5, "51");
    sinfs = self->_sinfs;
    self->_sinfs = v9;
  }
  else
  {
    sinfs = self;
    self = 0;
  }

  return self;
}

- (NSArray)sinfs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
}

@end