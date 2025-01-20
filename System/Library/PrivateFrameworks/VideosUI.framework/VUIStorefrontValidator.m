@interface VUIStorefrontValidator
+ (void)isValidStorefront:(id)a3 sharedStorefront:(id)a4 completion:(id)a5;
@end

@implementation VUIStorefrontValidator

+ (void)isValidStorefront:(id)a3 sharedStorefront:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VUITVAppLauncher sharedInstance];
  v11 = [v10 appController];
  v12 = [v11 appContext];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke;
  v16[3] = &unk_1E6DF4360;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  [v12 evaluate:v16];
}

void __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:@"VideoURLRouterInterface"];
  if ([v3 hasProperty:@"isValidStorefront"])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v10[0] = *(void *)(a1 + 32);
    v10[1] = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke_2;
    aBlock[3] = &unk_1E6DF3D80;
    id v9 = *(id *)(a1 + 48);
    v5 = _Block_copy(aBlock);
    v10[2] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    id v7 = (id)[v3 invokeMethod:@"isValidStorefront" withArguments:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __72__VUIStorefrontValidator_isValidStorefront_sharedStorefront_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end