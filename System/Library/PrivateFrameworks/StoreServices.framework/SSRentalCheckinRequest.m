@interface SSRentalCheckinRequest
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (SSRentalCheckinRequest)init;
- (SSRentalCheckinRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (SSRentalCheckinRequest)initWithSinfs:(id)a3;
- (SSRentalCheckinRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SSRentalCheckinRequest

- (SSRentalCheckinRequest)init
{
  return [(SSRentalCheckinRequest *)self initWithAccountIdentifier:0 rentalKeyIdentifier:0];
}

- (SSRentalCheckinRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  if (![a3 unsignedLongLongValue])
  {

    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Must have a valid account identifier";
LABEL_7:
    [v8 raise:v9 format:v10];
    return 0;
  }
  if (![a4 unsignedLongLongValue])
  {

    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Must have a valid rental key identifier";
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)SSRentalCheckinRequest;
  v7 = [(SSRequest *)&v12 init];
  if (v7)
  {
    v7->_accountIdentifier = (NSNumber *)[a3 copy];
    v7->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
  }
  return v7;
}

- (SSRentalCheckinRequest)initWithSinfs:(id)a3
{
  if ([a3 count])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRentalCheckinRequest;
    v5 = [(SSRequest *)&v7 init];
    if (v5) {
      v5->_sinfs = (NSArray *)[a3 copy];
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have at least one sinf"];
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRentalCheckinRequest;
  [(SSRequest *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountIdentifier;
  return v2;
}

- (NSNumber)rentalKeyIdentifier
{
  v2 = self->_rentalKeyIdentifier;
  return v2;
}

- (NSArray)sinfs
{
  v2 = self->_sinfs;
  return v2;
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SSRentalCheckinRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA8F20;
  v3[4] = a3;
  [(SSRentalCheckinRequest *)self startWithConnectionResponseBlock:v3];
}

uint64_t __51__SSRentalCheckinRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)startWithConnectionResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v21 = 136446210;
      v22 = "-[SSRentalCheckinRequest startWithConnectionResponseBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__SSRentalCheckinRequest_startWithConnectionResponseBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 59, v20, v18);
}

uint64_t __59__SSRentalCheckinRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      id v4 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
      id v5 = 0;
    }
    else
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
      id v5 = [[SSURLConnectionResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "2")];
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SSRentalCheckinRequest_startWithConnectionResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA8608;
    uint64_t v7 = *(void *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __59__SSRentalCheckinRequest_startWithConnectionResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_rentalKeyIdentifier);
  SSXPCDictionarySetCFObject(v3, "52", (__CFString *)self->_sinfs);
  return v3;
}

- (SSRentalCheckinRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRentalCheckinRequest;
    id v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      objc_opt_class();
      v5->_accountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
      objc_opt_class();
      v5->_rentalKeyIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "51");
      objc_opt_class();
      v5->_sinfs = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "52");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end