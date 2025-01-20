@interface SSItemLookupRequest
- (BOOL)start;
- (NSDictionary)parameters;
- (SSItemLookupRequest)init;
- (SSItemLookupRequest)initWithXPCEncoding:(id)a3;
- (id)_convertedValueForValue:(id)a3;
- (id)_copyItemsFromResponse:(id)a3 expirationDate:(id)a4;
- (id)_errorForStatusCode:(int64_t)a3;
- (id)copyQueryStringParameters;
- (id)copyXPCEncoding;
- (id)valueForParameter:(id)a3;
- (void)dealloc;
- (void)setValue:(id)a3 forParameter:(id)a4;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithItemLookupBlock:(id)a3;
@end

@implementation SSItemLookupRequest

- (SSItemLookupRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSItemLookupRequest;
  v2 = [(SSRequest *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSRequest *)v2 setShouldCancelAfterTaskExpiration:1];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemLookupRequest;
  [(SSRequest *)&v3 dealloc];
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  if (a3 && ![(SSItemLookupRequest *)self _convertedValueForValue:a3]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Value type not supported"];
  }
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSItemLookupRequest_setValue_forParameter___block_invoke;
  block[3] = &unk_1E5BA8630;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

void __45__SSItemLookupRequest_setValue_forParameter___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 96)) {
    *(void *)(*(void *)(a1 + 32) + 96) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1EF9AC4F0])
    {
      id v8 = (id)[*(id *)(a1 + 40) copy];
      [*(id *)(*(void *)(a1 + 32) + 96) setObject:v8 forKey:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);
      v6 = *(void **)(*(void *)(a1 + 32) + 96);
      uint64_t v7 = *(void *)(a1 + 48);
      [v6 setObject:v5 forKey:v7];
    }
  }
  else
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 96);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 removeObjectForKey:v4];
  }
}

- (void)startWithItemLookupBlock:(id)a3
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
      v22 = "-[SSItemLookupRequest startWithItemLookupBlock:]";
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
  v20[2] = __48__SSItemLookupRequest_startWithItemLookupBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 54, v20, v18);
}

uint64_t __48__SSItemLookupRequest_startWithItemLookupBlock___block_invoke(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 40)) {
    goto LABEL_16;
  }
  if (a2 == (void *)MEMORY[0x1E4F14520])
  {
    id v9 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
  }
  else
  {
    objc_opt_class();
    CFArrayRef v4 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
    if (v4)
    {
      CFArrayRef v5 = v4;
      int v6 = (void *)[(__CFArray *)v4 objectForKey:@"status-code"];
      if (v6)
      {
        unint64_t v7 = (unint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "_errorForStatusCode:", objc_msgSend(v6, "integerValue"));
        uint64_t v8 = 0;
      }
      else
      {
        objc_opt_class();
        CFArrayRef v10 = SSXPCDictionaryCopyCFObjectWithClass(a2, "2");
        if (!v10) {
          CFArrayRef v10 = (CFArrayRef)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
        }
        uint64_t v8 = [*(id *)(a1 + 32) _copyItemsFromResponse:v5 expirationDate:v10];

        unint64_t v7 = 0;
      }

      goto LABEL_13;
    }
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "3"));
  }
  unint64_t v7 = (unint64_t)v9;
  uint64_t v8 = 0;
LABEL_13:
  if (!(v8 | v7)) {
    unint64_t v7 = (unint64_t)(id)SSError(@"SSErrorDomain", 100, 0, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_16:
  uint64_t v11 = *(void **)(a1 + 32);
  return [v11 _shutdownRequest];
}

- (id)valueForParameter:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  CFArrayRef v10 = __Block_byref_object_copy__13;
  dispatchQueue = self->super._dispatchQueue;
  uint64_t v11 = __Block_byref_object_dispose__13;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSItemLookupRequest_valueForParameter___block_invoke;
  block[3] = &unk_1E5BA8F70;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __41__SSItemLookupRequest_valueForParameter___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 96) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__SSItemLookupRequest_start__block_invoke;
  v3[3] = &unk_1E5BA8F98;
  v3[4] = self;
  [(SSItemLookupRequest *)self startWithItemLookupBlock:v3];
  return 1;
}

void __28__SSItemLookupRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSItemLookupRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __28__SSItemLookupRequest_start__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 itemLookupRequest:*(void *)(a1 + 32) didFindItems:*(void *)(a1 + 40)];
    }
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
  v3[2] = __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA8FE8;
  v3[4] = a3;
  [(SSItemLookupRequest *)self startWithItemLookupBlock:v3];
}

void __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA8FC0;
    block[4] = a3;
    block[5] = a2;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_OWORD *)(a1 + 32) == 0) {
    SSError(@"SSErrorDomain", 100, 0, 0);
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SSItemLookupRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __38__SSItemLookupRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
}

- (SSItemLookupRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = [(SSItemLookupRequest *)self init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      if (v7)
      {
        CFArrayRef v8 = v7;

        v5->_parameters = (NSMutableDictionary *)[(__CFArray *)v8 mutableCopy];
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyQueryStringParameters
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  parameters = self->_parameters;
  uint64_t v5 = [(NSMutableDictionary *)parameters countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(parameters);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v14 + 1) + 8 * i);
        CFArrayRef v10 = (void *)[(NSMutableDictionary *)self->_parameters objectForKey:v9];
        id v11 = [(SSItemLookupRequest *)self _convertedValueForValue:v10];
        if (v11)
        {
          id v12 = v11;
          if ([(__CFString *)v9 isEqualToString:@"id"])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v10 count] > 1) {
              uint64_t v9 = @"ids";
            }
          }
          [v3 setObject:v12 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)parameters countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)parameters
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__13;
  CFArrayRef v10 = __Block_byref_object_dispose__13;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSItemLookupRequest_parameters__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__SSItemLookupRequest_parameters__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_copyItemsFromResponse:(id)a3 expirationDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [a3 objectForKey:@"item-metadata"];
  if (v7 || (uint64_t v7 = [a3 objectForKey:@"album-metadata"]) != 0)
  {
    id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
LABEL_4:
    uint64_t v9 = v8;
    goto LABEL_5;
  }
  long long v16 = (void *)[a3 objectForKey:@"items"];
  if (v16)
  {
    id v8 = v16;
    goto LABEL_4;
  }
  uint64_t v9 = 0;
LABEL_5:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [[SSItem alloc] initWithItemDictionary:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
        if ([(SSItem *)v14 ITunesStoreIdentifier])
        {
          [(SSItem *)v14 _setExpirationDate:a4];
          [v6 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v6;
}

- (id)_convertedValueForValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((id)*MEMORY[0x1E4F1CFD0] == a3)
    {
      return @"yes";
    }
    else if ((id)*MEMORY[0x1E4F1CFC8] == a3)
    {
      return @"no";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        [v5 setNumberStyle:1];
        [v5 setUsesGroupingSeparator:0];
        a3 = (id)[v5 stringFromNumber:a3];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v14;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v14 != v9) {
                  objc_enumerationMutation(a3);
                }
                id v11 = [(SSItemLookupRequest *)self _convertedValueForValue:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
                if (v11) {
                  [v6 addObject:v11];
                }
                ++v10;
              }
              while (v8 != v10);
              uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
            }
            while (v8);
          }
          a3 = (id)[v6 componentsJoinedByString:@","];
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return a3;
}

- (id)_errorForStatusCode:(int64_t)a3
{
  if (a3 == 2000) {
    uint64_t v3 = 301;
  }
  else {
    uint64_t v3 = 100;
  }
  return (id)SSError(@"SSErrorDomain", v3, 0, 0);
}

@end