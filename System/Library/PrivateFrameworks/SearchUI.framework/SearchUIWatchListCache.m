@interface SearchUIWatchListCache
- (SearchUIWatchListCache)init;
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
- (void)getButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6;
@end

@implementation SearchUIWatchListCache

- (SearchUIWatchListCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIWatchListCache;
  return [(TLKAsyncCache *)&v3 init];
}

- (void)getButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setIdentifier:v11];

  [v12 setType:v7];
  [v12 setIsHorizontallySrollingStyle:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__SearchUIWatchListCache_getButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
  v14[3] = &unk_1E6E74120;
  id v15 = v10;
  id v13 = v10;
  [(TLKAsyncCache *)self getObjectForKey:v12 completionHandler:v14];
}

void __103__SearchUIWatchListCache_getButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 state];
  v4 = [v3 buttonModels];
  v5 = [v3 error];

  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v6, v4, v5);
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v6 type];
  uint64_t v9 = [v6 isHorizontallySrollingStyle];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SearchUIWatchListCache_computeObjectForKey_completionHandler___block_invoke;
  v11[3] = &unk_1E6E73388;
  id v12 = v5;
  id v10 = v5;
  +[SearchUIWatchListUtilities computeButtonsForWatchListIdentifier:v7 type:v8 isHorizontallySrollingStyle:v9 completion:v11];
}

void __64__SearchUIWatchListCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = (id)objc_opt_new();
  [v10 setButtonModels:v8];

  [v10 setState:v9];
  [v10 setError:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end