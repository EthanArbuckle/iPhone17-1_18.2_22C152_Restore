@interface SUUIMissingItemLoader
- (NSString)imageProfile;
- (NSString)keyProfile;
- (SUUIMissingItemDelegate)delegate;
- (SUUIMissingItemLoader)init;
- (SUUIMissingItemLoader)initWithResourceLoader:(id)a3;
- (id)_existingRequestIDForItemID:(id)a3;
- (int64_t)batchSize;
- (void)_requestItems:(id)a3 withReason:(int64_t)a4;
- (void)itemRequest:(id)a3 didFinishWithItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)loadItemsForPageComponent:(id)a3 startIndex:(int64_t)a4 reason:(int64_t)a5;
- (void)loadItemsWithIdentifiers:(id)a3 reason:(int64_t)a4;
- (void)setBatchSize:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setKeyProfile:(id)a3;
@end

@implementation SUUIMissingItemLoader

- (SUUIMissingItemLoader)init
{
  return [(SUUIMissingItemLoader *)self initWithResourceLoader:0];
}

- (SUUIMissingItemLoader)initWithResourceLoader:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMissingItemLoader;
  v6 = [(SUUIMissingItemLoader *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_batchSize = 25;
    objc_storeStrong((id *)&v6->_keyProfile, (id)*MEMORY[0x263F7B9B0]);
    objc_storeStrong((id *)&v7->_loader, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requests = v7->_requests;
    v7->_requests = v8;
  }
  return v7;
}

- (void)loadItemsForPageComponent:(id)a3 startIndex:(int64_t)a4 reason:(int64_t)a5
{
  v8 = (objc_class *)MEMORY[0x263EFF980];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __69__SUUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke;
  v15 = &unk_265406CE8;
  id v11 = v10;
  id v16 = v11;
  v17 = self;
  [v9 enumerateMissingItemIdentifiersFromIndex:a4 usingBlock:&v12];

  if (objc_msgSend(v11, "count", v12, v13, v14, v15)) {
    [(SUUIMissingItemLoader *)self loadItemsWithIdentifiers:v11 reason:a5];
  }
}

uint64_t __69__SUUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t result = [*(id *)(a1 + 32) count];
  *a4 = result == *(void *)(*(void *)(a1 + 40) + 8);
  return result;
}

- (void)loadItemsWithIdentifiers:(id)a3 reason:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v14 = -[SUUIMissingItemLoader _existingRequestIDForItemID:](self, "_existingRequestIDForItemID:", v13, (void)v15);
        if (!v14
          || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_loader, "trySetReason:forRequestWithIdentifier:", a4, [v13 unsignedIntegerValue]))
        {
          [v7 addObject:v13];
          if ([v7 count] == self->_batchSize)
          {
            [(SUUIMissingItemLoader *)self _requestItems:v7 withReason:a4];
            [v7 removeAllObjects];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [(SUUIMissingItemLoader *)self _requestItems:v7 withReason:a4];
  }
}

- (void)itemRequest:(id)a3 didFinishWithItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  requests = self->_requests;
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "requestIdentifier"));
  [(NSMutableDictionary *)requests removeObjectForKey:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained missingItemLoader:self didLoadItems:v12 invalidItemIdentifiers:v8];
  }
}

- (id)_existingRequestIDForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__67;
  long long v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  requests = self->_requests;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__SUUIMissingItemLoader__existingRequestIDForItemID___block_invoke;
  v9[3] = &unk_265406D10;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)requests enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__SUUIMissingItemLoader__existingRequestIDForItemID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_requestItems:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = objc_alloc_init(SUUIItemResourceRequest);
  [(SUUIItemResourceRequest *)v9 setDelegate:self];
  [(SUUIItemResourceRequest *)v9 setImageProfile:self->_imageProfile];
  [(SUUIItemResourceRequest *)v9 setItemIdentifiers:v6];
  [(SUUIItemResourceRequest *)v9 setKeyProfile:self->_keyProfile];
  requests = self->_requests;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v9, "requestIdentifier"));
  [(NSMutableDictionary *)requests setObject:v6 forKey:v8];

  [(SUUIResourceLoader *)self->_loader loadResourceWithRequest:v9 reason:a4];
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (SUUIMissingItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIMissingItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end