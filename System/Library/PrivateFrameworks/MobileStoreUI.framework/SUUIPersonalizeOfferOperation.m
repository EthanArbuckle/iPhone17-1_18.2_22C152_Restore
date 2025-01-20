@interface SUUIPersonalizeOfferOperation
- (SUUIPersonalizeOfferOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUUIPersonalizeOfferOperation

- (SUUIPersonalizeOfferOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIPersonalizeOfferOperation;
  v8 = [(SUUIPersonalizeOfferOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v9->_itemID = a3;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIPersonalizeOfferOperation", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = v9->_dispatchQueue;
    v13 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v12, v13);
  }
  return v9;
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__17;
  dispatch_queue_t v10 = __Block_byref_object_dispose__17;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SUUIPersonalizeOfferOperation_outputBlock__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__SUUIPersonalizeOfferOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 272) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUUIPersonalizeOfferOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_265400DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __48__SUUIPersonalizeOfferOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 272);
  *(void *)(v3 + 272) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)main
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2_0;
  v26 = __Block_byref_object_dispose__3_0;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2_0;
  v20 = __Block_byref_object_dispose__3_0;
  id v21 = 0;
  uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", self->_itemID);
  id v4 = objc_alloc(MEMORY[0x263F7B3B8]);
  v5 = [(SUUIClientContext *)self->_clientContext platformContext];
  id v6 = (void *)[v4 initWithPlatformContext:v5];

  v28[0] = v3;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  [v6 setItemIdentifiers:v7];

  [v6 setKeyProfile:@"offer"];
  [v6 setPersonalizationStyle:0];
  id v8 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v6 setStoreFrontSuffix:v8];

  [v6 setTimeoutInterval:&unk_2705D0930];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__SUUIPersonalizeOfferOperation_main__block_invoke;
  v12[3] = &unk_265400DF0;
  id v9 = v3;
  id v13 = v9;
  v14 = &v22;
  objc_super v15 = &v16;
  [v6 setResponseBlock:v12];
  [v6 main];
  uint64_t v10 = [(SUUIPersonalizeOfferOperation *)self outputBlock];
  id v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v17[5], v23[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

void __37__SUUIPersonalizeOfferOperation_main__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [a2 itemForKey:a1[4]];
  id v8 = v7;
  if (v7)
  {
    id v20 = v6;
    [v7 offers];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_super v15 = [SUUIItemOffer alloc];
          uint64_t v16 = [v14 lookupDictionary];
          v17 = [(SUUIItemOffer *)v15 initWithLookupDictionary:v16];

          if ([(SUUIItemOffer *)v17 offerType] == 1)
          {
            uint64_t v18 = *(void *)(a1[6] + 8);
            v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;

            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v6 = v20;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end