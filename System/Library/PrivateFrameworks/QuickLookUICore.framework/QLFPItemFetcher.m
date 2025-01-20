@interface QLFPItemFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)isLongFetchOperation;
- (QLFPItemFetcher)initWithCoder:(id)a3;
- (QLFPItemFetcher)initWithFPItem:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4;
- (id)fileURL;
- (id)itemSize;
- (id)shareableItem;
- (void)_registerItemCollectionIfNeeded;
- (void)_unregisterItemCollectionIfNeeded;
- (void)_urlHandler:(id)a3;
- (void)collection:(id)a3 didUpdateObservedItem:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
- (void)prepareShareableItem:(id)a3;
@end

@implementation QLFPItemFetcher

- (QLFPItemFetcher)initWithFPItem:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [(QLUbiquitousItemFetcher *)self initWithZippingPackageIfNeeded:v4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fpItem, a3);
    v10 = v9;
  }

  return v9;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v18[3] = &unk_1E6DD3F48;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(QLFPItemFetcher *)self _urlHandler:v18];
}

void __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _registerItemCollectionIfNeeded];
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v9[3] = &unk_1E6DD3F20;
    v9[4] = v4;
    id v10 = *(id *)(a1 + 64);
    v8.receiver = v4;
    v8.super_class = (Class)QLFPItemFetcher;
    objc_msgSendSuper2(&v8, sel_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock_, v3, v5, v6, v9);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v7();
  }
}

void __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _unregisterItemCollectionIfNeeded];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_registerItemCollectionIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_itemCollection)
  {
    objc_sync_exit(obj);
  }
  else
  {
    v2 = [MEMORY[0x1E4F25D38] defaultManager];
    uint64_t v3 = [(FPItem *)obj->_fpItem itemID];
    uint64_t v4 = [v2 newCollectionWithItemID:v3];
    itemCollection = obj->_itemCollection;
    obj->_itemCollection = (FPItemCollection *)v4;

    id v6 = obj->_itemCollection;
    obj->_itemCollection = 0;

    objc_sync_exit(obj);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v9 = 0;
    id v10 = obj;
    v8[2] = __50__QLFPItemFetcher__registerItemCollectionIfNeeded__block_invoke;
    v8[3] = &unk_1E6DD3AA0;
    QLRunInMainThread(v8);
  }
}

uint64_t __50__QLFPItemFetcher__registerItemCollectionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 startObserving];
}

- (void)_unregisterItemCollectionIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_itemCollection;
  itemCollection = v2->_itemCollection;
  v2->_itemCollection = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__QLFPItemFetcher__unregisterItemCollectionIfNeeded__block_invoke;
    v5[3] = &unk_1E6DD3DB8;
    id v6 = v3;
    QLRunInMainThread(v5);
  }
}

uint64_t __52__QLFPItemFetcher__unregisterItemCollectionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  v2 = *(void **)(a1 + 32);
  return [v2 stopObserving];
}

- (void)_urlHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  fetchedURLHandler = self->_fetchedURLHandler;
  if (fetchedURLHandler)
  {
    (*((void (**)(id, QLURLHandler *, void))v4 + 2))(v4, fetchedURLHandler, 0);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F25D38] defaultManager];
    fpItem = self->_fpItem;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__QLFPItemFetcher__urlHandler___block_invoke;
    v9[3] = &unk_1E6DD3F70;
    v9[4] = self;
    id v10 = v5;
    [v7 fetchURLForItem:fpItem completionHandler:v9];
  }
}

void __31__QLFPItemFetcher__urlHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = (NSObject **)MEMORY[0x1E4F945F0];
    id v14 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 80);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch url for item: %@ error:%@ #Downloading", (uint8_t *)&v16, 0x16u);
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F3A6F8]);
    uint64_t v9 = [v8 initWithURL:v5 sandboxType:*MEMORY[0x1E4F3A748]];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 88);
    *(void *)(v10 + 88) = v9;

    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

- (void)dealloc
{
  [(QLFPItemFetcher *)self _unregisterItemCollectionIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)QLFPItemFetcher;
  [(QLUbiquitousItemFetcher *)&v3 dealloc];
}

- (id)fileURL
{
  return (id)[(QLURLHandler *)self->_fetchedURLHandler fileURL];
}

- (id)shareableItem
{
  return (id)[(QLURLHandler *)self->_fetchedURLHandler fileURL];
}

- (BOOL)isLongFetchOperation
{
  int v3 = [(FPItem *)self->_fpItem isCloudItem];
  if (v3) {
    LOBYTE(v3) = [(FPItem *)self->_fpItem isDownloaded] ^ 1;
  }
  return v3;
}

- (id)itemSize
{
  return (id)[(FPItem *)self->_fpItem documentSize];
}

- (void)prepareShareableItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__QLFPItemFetcher_prepareShareableItem___block_invoke;
  v6[3] = &unk_1E6DD3FC0;
  id v7 = v4;
  id v5 = v4;
  [(QLFPItemFetcher *)self _urlHandler:v6];
}

void __40__QLFPItemFetcher_prepareShareableItem___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __40__QLFPItemFetcher_prepareShareableItem___block_invoke_2;
  v1[3] = &unk_1E6DD3F98;
  id v2 = *(id *)(a1 + 32);
  QLRunInMainThread(v1);
}

uint64_t __40__QLFPItemFetcher_prepareShareableItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLFPItemFetcher;
  id v4 = a3;
  [(QLUbiquitousItemFetcher *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fpItem, @"fpItem", v5.receiver, v5.super_class);
}

- (QLFPItemFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLFPItemFetcher;
  objc_super v5 = [(QLUbiquitousItemFetcher *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpItem"];
    fpItem = v5->_fpItem;
    v5->_fpItem = (FPItem *)v6;

    id v8 = v5;
  }

  return v5;
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_fetchedURLHandler, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
}

@end