@interface SSPersonalizeOffersRequest
- (BOOL)start;
- (NSArray)items;
- (SSPersonalizeOffersRequest)initWithItems:(id)a3;
- (SSPersonalizeOffersRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithPersonalizedResponseBlock:(id)a3;
@end

@implementation SSPersonalizeOffersRequest

- (SSPersonalizeOffersRequest)initWithItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSPersonalizeOffersRequest;
  v4 = [(SSRequest *)&v6 init];
  if (v4) {
    v4->_items = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPersonalizeOffersRequest;
  [(SSRequest *)&v3 dealloc];
}

- (NSArray)items
{
  v2 = self->_items;
  return v2;
}

- (void)startWithPersonalizedResponseBlock:(id)a3
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
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v21 = 136446210;
      v22 = "-[SSPersonalizeOffersRequest startWithPersonalizedResponseBlock:]";
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
  v20[2] = __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 55, v20, v18);
}

uint64_t __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      uint64_t v6 = 121;
    }
    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      unint64_t v5 = [[SSPersonalizeOffersResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];
      if (v5 | v4)
      {
        int v7 = (void *)v5;
        if (v5)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v26 = v2;
          uint64_t v9 = *(void **)(*(void *)(v2 + 32) + 96);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "ITunesStoreIdentifier"), "stringValue");
                if (v15 && (uint64_t v16 = [v7 actionParametersForItemIdentifier:v15]) != 0)
                {
                  uint64_t v17 = v16;
                  v18 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", [v14 rawItemDictionary]);
                  uint64_t v19 = [(SSItem *)v18 defaultItemOffer];
                  [(SSItemOffer *)v19 setBuyParameters:v17];
                  uint64_t v20 = [(SSItem *)v18 itemKind];
                  uint64_t v21 = [v7 priceDisplayForItemType:v20];
                  if (v21) {
                    [(SSItemOffer *)v19 setPriceDisplay:v21];
                  }
                  uint64_t v22 = [v7 actionDisplayNameForItemType:v20];
                  [(SSItemOffer *)v19 setActionDisplayName:v22];
                  [(SSItemOffer *)v19 setOneTapOffer:v22 == 0];
                  [v8 addObject:v18];
                }
                else
                {
                  [v8 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
            }
            while (v11);
          }
          [v7 _setPersonalizedItems:v8];

          uint64_t v2 = v26;
        }
        goto LABEL_22;
      }
      uint64_t v6 = 100;
    }
    uint64_t v4 = (uint64_t)(id)SSError(@"SSErrorDomain", v6, 0, 0);
    int v7 = 0;
LABEL_22:
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA8608;
    uint64_t v24 = *(void *)(v2 + 40);
    block[5] = v4;
    block[6] = v24;
    block[4] = v7;
    dispatch_async(global_queue, block);
  }
  return [*(id *)(v2 + 32) _shutdownRequest];
}

uint64_t __65__SSPersonalizeOffersRequest_startWithPersonalizedResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__SSPersonalizeOffersRequest_start__block_invoke;
  v3[3] = &unk_1E5BABB38;
  v3[4] = self;
  [(SSPersonalizeOffersRequest *)self startWithPersonalizedResponseBlock:v3];
  return 1;
}

void __35__SSPersonalizeOffersRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSPersonalizeOffersRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __35__SSPersonalizeOffersRequest_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 personalizeOffersRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
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
  v3[2] = __55__SSPersonalizeOffersRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BABB60;
  v3[4] = a3;
  [(SSPersonalizeOffersRequest *)self startWithPersonalizedResponseBlock:v3];
}

uint64_t __55__SSPersonalizeOffersRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSPersonalizeOffersRequest)initWithXPCEncoding:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = [(SSRequest *)self init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v14 = [[SSItem alloc] initWithItemDictionary:v13];
              if (v14)
              {
                uint64_t v15 = v14;
                [v8 addObject:v14];
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      v5->_items = (NSArray *)[v8 copy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  items = self->_items;
  uint64_t v6 = [(NSArray *)items countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(items);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) rawItemDictionary];
        if (v10) {
          [(__CFString *)v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)items countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  SSXPCDictionarySetCFObject(v3, "50", v4);

  return v3;
}

@end