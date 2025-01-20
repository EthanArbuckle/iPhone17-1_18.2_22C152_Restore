@interface VUIJSKeyPlaysInterface
+ (void)fetchKeyPlays:(id)a3 nextToken:(id)a4 completion:(id)a5;
@end

@implementation VUIJSKeyPlaysInterface

+ (void)fetchKeyPlays:(id)a3 nextToken:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VUITVAppLauncher sharedInstance];
  v11 = [v10 appController];
  v12 = [v11 appContext];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__VUIJSKeyPlaysInterface_fetchKeyPlays_nextToken_completion___block_invoke;
  v16[3] = &unk_1E6DF4360;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  [v12 evaluate:v16];
}

void __61__VUIJSKeyPlaysInterface_fetchKeyPlays_nextToken_completion___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:@"KeyPlaysInterface"];
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v5;
  v6 = *(void **)(a1 + 40);
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIJSKeyPlaysInterface_fetchKeyPlays_nextToken_completion___block_invoke_2;
  aBlock[3] = &unk_1E6DF5FB8;
  id v12 = *(id *)(a1 + 48);
  id v8 = _Block_copy(aBlock);
  v13[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v10 = (id)[v3 invokeMethod:@"getKeyPlays" withArguments:v9];

  if (!v6)
  {

    if (v4) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
}

void __61__VUIJSKeyPlaysInterface_fetchKeyPlays_nextToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"error"];
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = v4;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v6 errorWithDomain:@"VUIJSKeyPlaysInterfaceErrorDomain" code:0 userInfo:v7];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end