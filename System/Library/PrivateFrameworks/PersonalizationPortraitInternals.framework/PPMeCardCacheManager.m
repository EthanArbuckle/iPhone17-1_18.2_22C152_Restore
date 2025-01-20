@interface PPMeCardCacheManager
- (PPMeCardCacheManager)initWithPath:(id)a3;
- (void)accessCacheWithBlock:(id)a3;
@end

@implementation PPMeCardCacheManager

- (void).cxx_destruct
{
}

- (void)accessCacheWithBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PPMeCardCacheManager_accessCacheWithBlock___block_invoke;
  v7[3] = &unk_1E65D5808;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __45__PPMeCardCacheManager_accessCacheWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PPMeCardCacheManager)initWithPath:(id)a3
{
  id v4 = a3;
  if (initWithPath___pasOnceToken11 != -1) {
    dispatch_once(&initWithPath___pasOnceToken11, &__block_literal_global_4586);
  }
  id v5 = (id)initWithPath___pasExprOnceResult;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4587;
  v20 = __Block_byref_object_dispose__4588;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__PPMeCardCacheManager_initWithPath___block_invoke_46;
  v12[3] = &unk_1E65D7C28;
  v15 = &v16;
  id v6 = v4;
  id v13 = v6;
  v7 = self;
  v14 = v7;
  [v5 runWithLockAcquired:v12];
  id v8 = (id)v17[5];

  v9 = v14;
  v10 = (PPMeCardCacheManager *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __37__PPMeCardCacheManager_initWithPath___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v19.receiver = *(id *)(a1 + 40);
    v19.super_class = (Class)PPMeCardCacheManager;
    id v7 = objc_msgSendSuper2(&v19, sel_init);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v10 = (void *)MEMORY[0x1CB79D060]();
      v11 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"me_card.pb"];
      v12 = [PPMeCardCache alloc];
      id v13 = v11;
      if (v12)
      {
        v20.receiver = v12;
        v20.super_class = (Class)PPMeCardCache;
        v14 = (id *)objc_msgSendSuper2(&v20, sel_init);
        v15 = v14;
        if (v14) {
          objc_storeStrong(v14 + 1, v11);
        }
      }
      else
      {
        v15 = 0;
      }

      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v15];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v18 = *(void **)(v17 + 8);
      *(void *)(v17 + 8) = v16;
    }
  }
}

void __37__PPMeCardCacheManager_initWithPath___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)initWithPath___pasExprOnceResult;
  initWithPath___pasExprOnceResult = v3;
}

@end