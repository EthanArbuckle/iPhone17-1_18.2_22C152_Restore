@interface SSRentalCheckoutRequest
- (BOOL)shouldCheckoutWithPlay;
- (BOOL)shouldValidateRentalInfo;
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (SSRentalCheckoutRequest)init;
- (SSRentalCheckoutRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (SSRentalCheckoutRequest)initWithDownloadIdentifier:(int64_t)a3;
- (SSRentalCheckoutRequest)initWithSinfs:(id)a3;
- (SSRentalCheckoutRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)downloadIdentifier;
- (unint64_t)checkoutType;
- (void)dealloc;
- (void)setCheckoutType:(unint64_t)a3;
- (void)setCheckoutWithPlay:(BOOL)a3;
- (void)setShouldValidateRentalInfo:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SSRentalCheckoutRequest

- (SSRentalCheckoutRequest)init
{
  return [(SSRentalCheckoutRequest *)self initWithSinfs:0];
}

- (SSRentalCheckoutRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
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
  v12.super_class = (Class)SSRentalCheckoutRequest;
  v7 = [(SSRequest *)&v12 init];
  if (v7)
  {
    v7->_accountIdentifier = (NSNumber *)[a3 copy];
    v7->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
    v7->_shouldValidateRentalInfo = 1;
  }
  return v7;
}

- (SSRentalCheckoutRequest)initWithDownloadIdentifier:(int64_t)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSRentalCheckoutRequest;
    result = [(SSRequest *)&v5 init];
    if (result)
    {
      result->_downloadIdentifier = a3;
      result->_shouldValidateRentalInfo = 1;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have a valid download identifier"];
    return 0;
  }
  return result;
}

- (SSRentalCheckoutRequest)initWithSinfs:(id)a3
{
  if ([a3 count])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRentalCheckoutRequest;
    objc_super v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      v5->_sinfs = (NSArray *)[a3 copy];
      v5->_shouldValidateRentalInfo = 1;
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
  v3.super_class = (Class)SSRentalCheckoutRequest;
  [(SSRequest *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountIdentifier;
  return v2;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
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
  v3[2] = __52__SSRentalCheckoutRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA8F20;
  v3[4] = a3;
  [(SSRentalCheckoutRequest *)self startWithConnectionResponseBlock:v3];
}

uint64_t __52__SSRentalCheckoutRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
      v22 = "-[SSRentalCheckoutRequest startWithConnectionResponseBlock:]";
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
  v20[2] = __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 60, v20, v18);
}

uint64_t __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2)
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
    block[2] = __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA8608;
    uint64_t v7 = *(void *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  xpc_dictionary_set_BOOL(v3, "55", self->_checkoutWithPlay);
  xpc_dictionary_set_int64(v3, "51", self->_downloadIdentifier);
  SSXPCDictionarySetCFObject(v3, "52", (__CFString *)self->_rentalKeyIdentifier);
  SSXPCDictionarySetCFObject(v3, "54", (__CFString *)self->_sinfs);
  xpc_dictionary_set_BOOL(v3, "53", self->_shouldValidateRentalInfo);
  xpc_dictionary_set_uint64(v3, "56", self->_checkoutType);
  return v3;
}

- (SSRentalCheckoutRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    self->_accountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
    self->_checkoutWithPlay = xpc_dictionary_get_BOOL(a3, "55");
    self->_downloadIdentifier = xpc_dictionary_get_int64(a3, "51");
    objc_opt_class();
    self->_rentalKeyIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "52");
    objc_opt_class();
    self->_sinfs = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "54");
    self->_shouldValidateRentalInfo = xpc_dictionary_get_BOOL(a3, "53");
    self->_checkoutType = xpc_dictionary_get_uint64(a3, "56");
  }
  else
  {

    return 0;
  }
  return self;
}

- (BOOL)shouldValidateRentalInfo
{
  return self->_shouldValidateRentalInfo;
}

- (void)setShouldValidateRentalInfo:(BOOL)a3
{
  self->_shouldValidateRentalInfo = a3;
}

- (BOOL)shouldCheckoutWithPlay
{
  return self->_checkoutWithPlay;
}

- (void)setCheckoutWithPlay:(BOOL)a3
{
  self->_checkoutWithPlay = a3;
}

- (unint64_t)checkoutType
{
  return self->_checkoutType;
}

- (void)setCheckoutType:(unint64_t)a3
{
  self->_checkoutType = a3;
}

@end