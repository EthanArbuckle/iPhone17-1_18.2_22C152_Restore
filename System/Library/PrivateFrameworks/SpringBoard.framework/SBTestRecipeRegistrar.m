@interface SBTestRecipeRegistrar
+ (void)_lock_registerRecipeWithClass:(Class)a3;
+ (void)registerAllTestRecipes;
+ (void)registerWindowScene:(id)a3;
@end

@implementation SBTestRecipeRegistrar

+ (void)registerAllTestRecipes
{
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBTestRecipeRegistrar_registerAllTestRecipes__block_invoke;
  block[3] = &__block_descriptor_40_e12_v24__0_8_B16l;
  block[4] = a1;
  objc_enumerateClasses(0, 0, (Protocol *)&unk_1F3385940, 0, block);
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

void __47__SBTestRecipeRegistrar_registerAllTestRecipes__block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1D948C4D0]();
  if ((objc_opt_respondsToSelector() & 1) == 0 || [a2 shouldRegisterTestRecipe]) {
    objc_msgSend(*(id *)(a1 + 32), "_lock_registerRecipeWithClass:", a2);
  }
}

+ (void)registerWindowScene:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __45__SBTestRecipeRegistrar_registerWindowScene___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (id)__recipes;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "windowSceneDidUpdate:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

+ (void)_lock_registerRecipeWithClass:(Class)a3
{
  if (!__recipes)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = (void *)__recipes;
    __recipes = (uint64_t)v4;
  }
  id v6 = objc_alloc_init(a3);
  [(id)__recipes addObject:v6];
  v7 = (void *)MEMORY[0x1E4F94128];
  long long v8 = [v6 title];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke;
  v17[3] = &unk_1E6AF4AC0;
  id v18 = v6;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke_2;
  v15 = &unk_1E6AF4AC0;
  id v9 = v18;
  id v16 = v9;
  long long v10 = [v7 recipeWithTitle:v8 increaseAction:v17 decreaseAction:&v12];

  long long v11 = objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    long long v11 = objc_msgSend(v9, "domainClass", v12, v13, v14, v15);
  }
  objc_msgSend(v11, "registerTestRecipe:", v10, v12, v13, v14, v15);
}

uint64_t __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleVolumeIncrease];
}

uint64_t __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleVolumeDecrease];
}

@end