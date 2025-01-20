@interface UIVisualEffectVibrantLayerConfig
@end

@implementation UIVisualEffectVibrantLayerConfig

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke(id *a1)
{
  v2 = +[UIColor whiteColor];
  [a1[4] setTintColor:v2];

  v3 = [a1[5] filterAttributes];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_2;
  v17 = &unk_1E52DA238;
  id v18 = a1[6];
  id v19 = a1[7];
  [v3 enumerateKeysAndObjectsUsingBlock:&v14];

  v4 = [a1[5] vibrantColor];
  v5 = v4;
  if (!v4)
  {
    v5 = +[UIColor clearColor];
  }
  v6 = [v5 CGColor];
  if (!v4) {

  }
  v7 = [a1[5] tintColor];
  v8 = v7;
  if (!v7)
  {
    v8 = +[UIColor clearColor];
  }
  v9 = [v8 CGColor];
  if (!v7) {

  }
  id v10 = a1[6];
  v11 = [NSString stringWithFormat:@"filters.%@.%@", a1[7], @"inputColor0", v14, v15, v16, v17];
  [v10 setValue:v6 forKeyPath:v11];

  id v12 = a1[6];
  v13 = [NSString stringWithFormat:@"filters.%@.%@", a1[7], @"inputColor1"];
  [v12 setValue:v9 forKeyPath:v13];
}

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = NSString;
  id v7 = a3;
  id v8 = [v6 stringWithFormat:@"filters.%@.%@", v5, a2];
  [v4 setValue:v7 forKeyPath:v8];
}

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_3(uint64_t a1)
{
  v2 = +[UIColor whiteColor];
  [*(id *)(a1 + 32) setTintColor:v2];

  id v3 = +[UIColor clearColor];
  v4 = [v3 CGColor];

  uint64_t v5 = [MEMORY[0x1E4F39BC0] filterWithType:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 48) filterAttributes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_4;
  v14[3] = &unk_1E52DD478;
  v14[4] = *(void *)(a1 + 64);
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setValue:v4 forKey:@"inputColor0"];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setValue:v4 forKey:@"inputColor1"];
  uint64_t v9 = [*(id *)(a1 + 56) filters];
  id v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  v13 = [v12 arrayByAddingObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  [*(id *)(a1 + 56) setFilters:v13];
}

uint64_t __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValue:a3 forKey:a2];
}

void __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_2;
  v2[3] = &unk_1E52D9F98;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:v2];
}

void __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = [*(id *)(a1 + 32) filters];
  id v4 = [v2 arrayWithArray:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "filters", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 type];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

        if (v12) {
          [v4 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setFilters:v4];
}

uint64_t __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end