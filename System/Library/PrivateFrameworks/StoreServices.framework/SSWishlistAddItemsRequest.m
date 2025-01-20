@interface SSWishlistAddItemsRequest
- (NSArray)items;
- (NSString)caller;
- (NSString)version;
- (SSWishlistAddItemsRequest)init;
- (SSWishlistAddItemsRequest)initWithItems:(id)a3 caller:(id)a4 version:(id)a5;
- (SSWishlistAddItemsRequest)initWithXPCEncoding:(id)a3;
- (id)_convertedValueForValue:(id)a3;
- (id)copyQueryStringParameters;
- (id)copyXPCEncoding;
- (void)startWithAddItemsResponseBlock:(id)a3;
@end

@implementation SSWishlistAddItemsRequest

- (SSWishlistAddItemsRequest)init
{
  return [(SSWishlistAddItemsRequest *)self initWithItems:0 caller:0 version:0];
}

- (SSWishlistAddItemsRequest)initWithItems:(id)a3 caller:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SSWishlistAddItemsRequest;
  v11 = [(SSRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    caller = v11->_caller;
    v11->_caller = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    version = v11->_version;
    v11->_version = (NSString *)v16;
  }
  return v11;
}

- (void)startWithAddItemsResponseBlock:(id)a3
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
      v22 = "-[SSWishlistAddItemsRequest startWithAddItemsResponseBlock:]";
      LODWORD(v18) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

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
  v19[2] = __60__SSWishlistAddItemsRequest_startWithAddItemsResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:166 messageBlock:v19];
}

void __60__SSWishlistAddItemsRequest_startWithAddItemsResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
      CFArrayRef v4 = 0;
    }
    else
    {
      objc_opt_class();
      CFArrayRef v4 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(xdict, "2");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];

      if (!v7)
      {
        id v8 = [(__CFArray *)v4 objectForKey:@"status"];
        if ([v8 intValue])
        {
          int v9 = [(__CFArray *)v4 objectForKey:@"msg"];
          int v7 = SSError(@"SSErrorDomain", 137, 0, (uint64_t)v9);
        }
        else
        {
          int v7 = 0;
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SSWishlistAddItemsRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __44__SSWishlistAddItemsRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "0", *(__CFString **)(*(void *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(void *)(a1 + 40) + 104));
  v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = *(__CFString **)(*(void *)(a1 + 40) + 112);
  SSXPCDictionarySetCFObject(v2, "2", v3);
}

- (SSWishlistAddItemsRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    id v6 = [(SSWishlistAddItemsRequest *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    objc_opt_class();
    uint64_t v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
    items = v6->_items;
    v6->_items = (NSArray *)v8;

    objc_opt_class();
    uint64_t v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
    caller = v6->_caller;
    v6->_caller = (NSString *)v10;

    objc_opt_class();
    uint64_t v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
    self = (SSWishlistAddItemsRequest *)v6->_version;
    v6->_version = (NSString *)v12;
  }
  else
  {
    id v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyQueryStringParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_items)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__77;
    uint64_t v16 = __Block_byref_object_dispose__77;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = self->_items;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__SSWishlistAddItemsRequest_copyQueryStringParameters__block_invoke;
    v11[3] = &unk_1E5BAE5A0;
    v11[4] = self;
    v11[5] = &v12;
    [(NSArray *)items enumerateObjectsUsingBlock:v11];
    id v5 = [(id)v13[5] componentsJoinedByString:@","];
    [v3 setObject:v5 forKey:@"ids"];

    _Block_object_dispose(&v12, 8);
  }
  version = self->_version;
  if (version)
  {
    int v7 = (void *)[(NSString *)version copy];
    [v3 setObject:v7 forKey:@"version"];
  }
  caller = self->_caller;
  if (caller)
  {
    id v9 = (void *)[(NSString *)caller copy];
    [v3 setObject:v9 forKey:@"caller"];
  }
  return v3;
}

void __54__SSWishlistAddItemsRequest_copyQueryStringParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _convertedValueForValue:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    id v3 = v4;
  }
}

- (id)_convertedValueForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_7:
    uint64_t v8 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)_convertedValueForValue__formatter;
    if (!_convertedValueForValue__formatter)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      int v7 = (void *)_convertedValueForValue__formatter;
      _convertedValueForValue__formatter = (uint64_t)v6;

      [(id)_convertedValueForValue__formatter setNumberStyle:1];
      [(id)_convertedValueForValue__formatter setUsesGroupingSeparator:0];
      id v5 = (void *)_convertedValueForValue__formatter;
    }
    id v4 = [v5 stringFromNumber:v3];
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)caller
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end