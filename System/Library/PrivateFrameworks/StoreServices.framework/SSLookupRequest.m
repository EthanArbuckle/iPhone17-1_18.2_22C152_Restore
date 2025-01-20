@interface SSLookupRequest
- (BOOL)authenticatesIfNeeded;
- (BOOL)start;
- (NSString)keyProfile;
- (SSAuthenticationContext)authenticationContext;
- (SSLookupProperties)_lookupProperties;
- (SSLookupRequest)init;
- (SSLookupRequest)initWithLocation:(id)a3;
- (SSLookupRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (id)valueForRequestParameter:(id)a3;
- (int64_t)localizationStyle;
- (int64_t)personalizationStyle;
- (int64_t)resultFilters;
- (void)_setTimeoutInterval:(id)a3;
- (void)dealloc;
- (void)setAuthenticatesIfNeeded:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setKeyProfile:(id)a3;
- (void)setLocalizationStyle:(int64_t)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setResultFilters:(int64_t)a3;
- (void)setValue:(id)a3 forRequestParameter:(id)a4;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithLookupBlock:(id)a3;
@end

@implementation SSLookupRequest

- (SSLookupRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSLookupRequest;
  v2 = [(SSRequest *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(SSLookupProperties);
    v2->_properties = v3;
    [(SSLookupProperties *)v3 setValue:@"1" forRequestParameter:@"version"];
  }
  return v2;
}

- (SSLookupRequest)initWithLocation:(id)a3
{
  v4 = [(SSLookupRequest *)self init];
  objc_super v5 = v4;
  if (v4) {
    [(SSLookupProperties *)v4->_properties setLocation:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLookupRequest;
  [(SSRequest *)&v3 dealloc];
}

- (BOOL)authenticatesIfNeeded
{
  return self->_personalizationStyle == 1;
}

- (NSString)keyProfile
{
  return [(SSLookupProperties *)self->_properties keyProfile];
}

- (int64_t)localizationStyle
{
  return [(SSLookupProperties *)self->_properties localizationStyle];
}

- (void)setAuthenticatesIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SSLookupRequest *)self authenticatesIfNeeded] != a3) {
    self->_personalizationStyle = v3;
  }
}

- (void)setKeyProfile:(id)a3
{
}

- (void)setLocalizationStyle:(int64_t)a3
{
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
}

- (void)startWithLookupBlock:(id)a3
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
      v22 = "-[SSLookupRequest startWithLookupBlock:]";
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
  v20[2] = __40__SSLookupRequest_startWithLookupBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 85, v20, v18);
}

uint64_t __40__SSLookupRequest_startWithLookupBlock___block_invoke(uint64_t a1, void *a2)
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
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      id v5 = [[SSLookupResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  int v6 = *(void **)(a1 + 32);
  return [v6 _shutdownRequest];
}

- (id)valueForRequestParameter:(id)a3
{
  return [(SSLookupProperties *)self->_properties valueForRequestParameter:a3];
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __24__SSLookupRequest_start__block_invoke;
  v3[3] = &unk_1E5BAC220;
  v3[4] = self;
  [(SSLookupRequest *)self startWithLookupBlock:v3];
  return 1;
}

void __24__SSLookupRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SSLookupRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __24__SSLookupRequest_start__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      return [v2 requestDidFinish:v4];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v2 request:v5 didFailWithError:v6];
    }
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SSLookupRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BAC248;
  v3[4] = a3;
  [(SSLookupRequest *)self startWithLookupBlock:v3];
}

void __44__SSLookupRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SSLookupRequest_startWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA8FC0;
    block[4] = a3;
    block[5] = a2;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __44__SSLookupRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_OWORD *)(a1 + 32) == 0) {
    SSError(@"SSErrorDomain", 100, 0, 0);
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (SSLookupProperties)_lookupProperties
{
  v2 = (void *)[(SSLookupProperties *)self->_properties copy];
  return (SSLookupProperties *)v2;
}

- (void)_setTimeoutInterval:(id)a3
{
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticationContext);
  xpc_dictionary_set_int64(v3, "1", self->_personalizationStyle);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_properties);
  return v3;
}

- (SSLookupRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSLookupRequest;
    uint64_t v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      v5->_authenticationContext = [[SSAuthenticationContext alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "0")];
      v5->_personalizationStyle = xpc_dictionary_get_int64(a3, "1");
      v5->_properties = [[SSLookupProperties alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "2")];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (int64_t)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(int64_t)a3
{
  self->_resultFilters = a3;
}

@end