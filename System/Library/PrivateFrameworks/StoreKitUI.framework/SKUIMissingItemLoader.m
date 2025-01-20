@interface SKUIMissingItemLoader
- (NSString)imageProfile;
- (NSString)keyProfile;
- (SKUIMissingItemDelegate)delegate;
- (SKUIMissingItemLoader)init;
- (SKUIMissingItemLoader)initWithResourceLoader:(id)a3;
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

@implementation SKUIMissingItemLoader

- (SKUIMissingItemLoader)init
{
  return [(SKUIMissingItemLoader *)self initWithResourceLoader:0];
}

- (SKUIMissingItemLoader)initWithResourceLoader:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMissingItemLoader initWithResourceLoader:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMissingItemLoader;
  v6 = [(SKUIMissingItemLoader *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_batchSize = 25;
    objc_storeStrong((id *)&v6->_keyProfile, (id)*MEMORY[0x1E4FA86D0]);
    objc_storeStrong((id *)&v7->_loader, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requests = v7->_requests;
    v7->_requests = v8;
  }
  return v7;
}

- (void)loadItemsForPageComponent:(id)a3 startIndex:(int64_t)a4 reason:(int64_t)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __69__SKUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke;
  v15 = &unk_1E6425578;
  id v11 = v10;
  id v16 = v11;
  v17 = self;
  [v9 enumerateMissingItemIdentifiersFromIndex:a4 usingBlock:&v12];

  if (objc_msgSend(v11, "count", v12, v13, v14, v15)) {
    [(SKUIMissingItemLoader *)self loadItemsWithIdentifiers:v11 reason:a5];
  }
}

uint64_t __69__SKUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t result = [*(id *)(a1 + 32) count];
  *a4 = result == *(void *)(*(void *)(a1 + 40) + 8);
  return result;
}

- (void)loadItemsWithIdentifiers:(id)a3 reason:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
        v14 = -[SKUIMissingItemLoader _existingRequestIDForItemID:](self, "_existingRequestIDForItemID:", v13, (void)v15);
        if (!v14
          || !-[SKUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_loader, "trySetReason:forRequestWithIdentifier:", a4, [v13 unsignedIntegerValue]))
        {
          [v7 addObject:v13];
          if ([v7 count] == self->_batchSize)
          {
            [(SKUIMissingItemLoader *)self _requestItems:v7 withReason:a4];
            [v7 removeAllObjects];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [(SKUIMissingItemLoader *)self _requestItems:v7 withReason:a4];
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
  long long v15 = __Block_byref_object_copy__79;
  long long v16 = __Block_byref_object_dispose__79;
  id v17 = 0;
  requests = self->_requests;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SKUIMissingItemLoader__existingRequestIDForItemID___block_invoke;
  v9[3] = &unk_1E64294D8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)requests enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __53__SKUIMissingItemLoader__existingRequestIDForItemID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
  uint64_t v9 = objc_alloc_init(SKUIItemResourceRequest);
  [(SKUIItemResourceRequest *)v9 setDelegate:self];
  [(SKUIItemResourceRequest *)v9 setImageProfile:self->_imageProfile];
  [(SKUIItemResourceRequest *)v9 setItemIdentifiers:v6];
  [(SKUIItemResourceRequest *)v9 setKeyProfile:self->_keyProfile];
  requests = self->_requests;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v9, "requestIdentifier"));
  [(NSMutableDictionary *)requests setObject:v6 forKey:v8];

  [(SKUIResourceLoader *)self->_loader loadResourceWithRequest:v9 reason:a4];
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (SKUIMissingItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIMissingItemDelegate *)WeakRetained;
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

- (void)initWithResourceLoader:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMissingItemLoader initWithResourceLoader:]";
}

@end