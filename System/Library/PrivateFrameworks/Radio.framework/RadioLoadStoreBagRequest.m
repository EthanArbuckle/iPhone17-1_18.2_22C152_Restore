@interface RadioLoadStoreBagRequest
- (BOOL)ignoresRadioDiskCache;
- (void)loadStoreBagWithOptions:(int64_t)a3 completionHandler:(id)a4;
- (void)setIgnoresRadioDiskCache:(BOOL)a3;
@end

@implementation RadioLoadStoreBagRequest

- (void)loadStoreBagWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  unint64_t v6 = ((unint64_t)a3 >> 1) & 1;
  id v7 = objc_alloc(MEMORY[0x263F89360]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke;
  v13[3] = &__block_descriptor_33_e31_v16__0__ICStoreRequestContext_8l;
  char v14 = v6;
  v8 = (void *)[v7 initWithBlock:v13];
  v9 = [MEMORY[0x263F893A0] sharedBagProvider];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_2643AA5F0;
  id v12 = v5;
  id v10 = v5;
  [v9 getBagForRequestContext:v8 forceRefetch:v6 withCompletionHandler:v11];
}

void __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  id v6 = [[RadioStoreBag alloc] _initWithURLBag:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v6, v8);
  }
}

void __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F893C0];
  id v5 = a2;
  v4 = [v3 activeAccount];
  [v5 setIdentity:v4];

  [v5 setAllowsExpiredBags:*(unsigned char *)(a1 + 32) == 0];
}

- (void)setIgnoresRadioDiskCache:(BOOL)a3
{
  *(&self->super._asynchronousBackgroundRequest + 1) = a3;
}

- (BOOL)ignoresRadioDiskCache
{
  return *(&self->super._asynchronousBackgroundRequest + 1);
}

@end